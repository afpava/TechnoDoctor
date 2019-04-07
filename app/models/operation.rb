class Operation < ApplicationRecord
  has_and_belongs_to_many :tickets
  belongs_to :category

  validates :description, presence: true, uniqueness: { scope: :category,
    message: "Operation exists!" }
  validates :price, presence: true, numericality: { only_float: true,
      message: "Price must be a number" }
      
  scope :by_category, -> category { where(category: category) if category }
end
