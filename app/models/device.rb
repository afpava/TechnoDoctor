class Device < ApplicationRecord
  has_many :tickets
  belongs_to :model
  # belongs_to :brand
  # belongs_to :category
  accepts_nested_attributes_for :tickets, allow_destroy: true

end
