class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }

  belongs_to :customer
  has_many :order_items, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  def shipping.address
    if select.address == "ご自身の住所"
      puts = Customer.zip_code
      puts = Customer.addresss
      puts = Customer.name
    elsif select.address == "登録住所から選択"
      puts = @address
    elsif select.address == "新しいお届け先"
      puts = @address.zip_code,
      puts = @address.address
      puts = @address.name
    end
  end
end

