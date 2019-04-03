class Model < ApplicationRecord
  belongs_to :brand
  has_many :devices
end
