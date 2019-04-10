class Collaborator < ApplicationRecord
  has_many :tickets
  belongs_to :user

  enum position: [:account_reciveble, :technical_support, :service_manager, :owner]
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :nickname, uniqueness: true


  require 'carrierwave'
  require 'carrierwave/orm/activerecord'
  mount_uploader :avatar, ImageUploader

  def full_name
    [self.first_name, self.last_name].join(" ")
  end

end
