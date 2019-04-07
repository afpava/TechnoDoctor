class Collaborator < ApplicationRecord
  has_many :tickets
  accepts_nested_attributes_for :tickets, allow_destroy: true

  enum position: [:account_reciveble, :technical_support, :service_manager, :owner]


  require 'carrierwave'
  require 'carrierwave/orm/activerecord'
  mount_uploader :avatar, ImageUploader
  
  def full_name
    [self.first_name, self.last_name].join(" ")
  end

end
