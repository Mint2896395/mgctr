class Person < ApplicationRecord
  belongs_to :section
  has_many :cards
end
