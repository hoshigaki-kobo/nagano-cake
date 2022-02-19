class Item < ApplicationRecord
  
  belongs_to :genre
  has_many :cart_items
  has_many :order_items
  
  has_one_attached :item_image
end
