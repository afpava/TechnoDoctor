class Operation < ApplicationRecord
  has_and_belongs_to_many :tickets
  belongs_to :category
end
