class Customer < ApplicationRecord
  has_many :tickets
  belongs_to :user, optional: true
  accepts_nested_attributes_for :tickets, allow_destroy: true

  def full_name
    [self.first_name, self.last_name].join(" ") if !self.first_name.blank? && !self.last_name.blank?
  end

end
