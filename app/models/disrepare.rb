class Disrepare < ApplicationRecord
  has_and_belongs_to_many :tickets, uniq: true
  belongs_to :category
end
