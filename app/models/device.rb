class Device < ApplicationRecord
  has_many :tickets
  belongs_to :model
  # belongs_to :brand
  # belongs_to :category
  validates :imei, format: { with: /\A[0-9]{15}\Z/,
      message: "IMEI must contain 15 digits" }
end
