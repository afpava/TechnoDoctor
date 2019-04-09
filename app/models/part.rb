class Part < ApplicationRecord
  belongs_to :ticket
  validates :description, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :quantity, presence: true, numericality: { only_integer: true }
end
