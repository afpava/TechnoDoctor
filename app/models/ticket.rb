class Ticket < ApplicationRecord

  belongs_to :customer
  belongs_to :device, optional: true
  belongs_to :collaborator, optional: true
  has_and_belongs_to_many :disrepares, uniq: true
  has_and_belongs_to_many :operations, uniq: true
  has_one :user
  has_many :parts
  enum stage: [:accepted, :in_progress, :done, :taken]
  accepts_nested_attributes_for :device, allow_destroy: true
  accepts_nested_attributes_for :customer, allow_destroy: true
  accepts_nested_attributes_for :collaborator, allow_destroy: true

  after_initialize do
      if self.new_record?
        self.role ||= :accepted
      end
  end

  def pay_price
    self.total_price - self.prepayment if !self.total_price.blank? && !self.prepayment.blank?
  end

  def earned_money
    self.total_price - self.parts.pluck(:price).sum if !self.total_price.blank? && !self.parts.blank?
  end

  def sum_prices(object)
    parts =  self.parts.pluck(:price, :quantity)
    parts.map! {|part| part.inject(:*)}
    total = self.operations.pluck(:price).sum + parts.sum
    object.update(total_price: total)
  end

  def update_relation(relation, model, object)
    model = model.humanize
    if relation.present?
      rel = model.constantize.find(relation)
      rel.tickets << object
    end
  end

  def update_relations(new_relations, model, object)

    models = model.pluralize
    old_relations = object.send(models).ids
    models_remove_ids = old_relations - new_relations
    models_add_ids = new_relations - old_relations

    models_remove_ids.each do |id|
       object.send(models).delete(id)
    end

    models_add_ids.each do |id|
        unit = model.humanize.constantize.find(id)
        object.send(models) << unit
    end

  end

end
