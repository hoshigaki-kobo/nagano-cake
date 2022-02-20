class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item


  def subtotal
    item.tax_included * quantity
  end
  
end
