class Sale < ApplicationRecord
  has_one :street
  belongs_to :user
  belongs_to :item 
end
