class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: {
    入金待ち: 0,
    入金確認: 1,
    製作中: 2,
    発送準備中: 3,
    発送済み: 4,
  }




  def @shipping.address
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

