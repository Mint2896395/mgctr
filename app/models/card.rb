class Card < ApplicationRecord
  belongs_to :person
  paginates_per 20
end
