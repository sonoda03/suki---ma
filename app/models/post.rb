class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  
  has_one_attached :post_image
end