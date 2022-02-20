class Item < ApplicationRecord

  belongs_to :genre
  has_many :cart_items
  has_many :order_items

  validates :is_active, inclusion: [true, false]

  has_one_attached :item_image

  def get_item_image(size)
    unless image_item.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpg")
      profile_image.attach(io: File.open(file_path),filename: "default-image.jpg",content_type: "image/jpeg")
    end
    profile_image.variant(resize: size).processed
  end
end
