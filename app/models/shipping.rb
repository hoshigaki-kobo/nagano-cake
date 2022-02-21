class Shipping < ApplicationRecord
  
  belongs_to :customer

  def shipping_display
    '〒' + zip_code + ' ' + address + ' ' + name
  end
end
