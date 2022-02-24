class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy

  enum payment: { credit_card: 0, transfer: 1 }
  enum order_status: {
    入金待ち: 0,
    入金確認: 1,
    製作中: 2,
    発送準備中: 3,
    発送済み: 4,
  }
  def top
    @order = Order.page(params[:page])
  end

  def total_quantity
    sum = 0
    self.order_items.each do |order_item|
      sum = sum + order_item.quantity
    end
    sum
  end
end