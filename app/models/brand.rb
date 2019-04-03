class Brand < ApplicationRecord
  belongs_to :category
  has_many :models
  has_many :devices
  validates :description, presence: true, uniqueness: true


scope :by_category, -> category { where(category: category) if category }



end
