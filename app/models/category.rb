class Category < ApplicationRecord
  # has_many :devices
  has_many :brands
  # has_many :models
  has_many :disrepares
  has_many :operations
  validates :description, presence: true, uniqueness: true
end
