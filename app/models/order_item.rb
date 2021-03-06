class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum item_status: {
    着手不可: 0,
    製作待ち: 1,
    製作中: 2,
    製作完了: 3,
    製作済み: 4,
  }
end