class Model < ApplicationRecord
  belongs_to :brand
  has_many :devices

  validates :description, presence: true, uniqueness: { scope: :brand,
		message: "Model exists!" }
end
