class Collaborator < ApplicationRecord
  has_many :tickets
  accepts_nested_attributes_for :tickets, allow_destroy: true

  enum position: [:service_manager, :technical_support, :account_reciveble, :owner]

  after_initialize do
      if self.new_record?
        self.role ||= :account_reciveble
      end
  end

  require 'carrierwave'
  require 'carrierwave/orm/activerecord'
  mount_uploader :avatar, ImageUploader

  def full_name
    [self.first_name, self.last_name].join(" ")
  end

end
