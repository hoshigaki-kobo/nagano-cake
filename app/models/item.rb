class Item < ApplicationRecord

  belongs_to :genre
  has_many :cart_items
  has_many :order_items

  validates :is_active, inclusion: [true, false]

  with_options presence: true do
    validates :name
    validates :introduction
    validates :item_image
    validates :tax_included, format: {with: /\A[0-9]+\z/i}
  end


  has_one_attached :item_image

  def get_item_image(size)
    unless item_image.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpg")
      item_image.attach(io: File.open(file_path),filename: "default-image.jpg",content_type: "image/jpeg")
    end
    item_image.variant(resize: size).processed
  end

  def with_tax_price
    (tax_included*1.1).floor
  end

end
