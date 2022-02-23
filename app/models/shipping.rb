class Shipping < ApplicationRecord

  belongs_to :customer

  with_options presence: true do
    validates :zip_code
    validates :address
    validates :name
  end

  def shipping_display
    '〒' + zip_code + ' ' + address + ' ' + name
  end
end
