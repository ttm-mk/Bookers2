class Book < ApplicationRecord
  
  has_one attached :image
  belongs_to :users
  
end
