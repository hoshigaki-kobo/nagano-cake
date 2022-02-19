class Shipping < ApplicationRecord

  def shipping_display
    '〒' + zip_code + ' ' + address + ' ' + name
  end
end
