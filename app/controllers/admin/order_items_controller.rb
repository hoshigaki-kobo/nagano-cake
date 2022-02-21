class Admin::OrderItemsController < ApplicationController

  def cart_items
    cart_items = current_customer.cart_items
		cart_items.each do |cart_item|
		order_item = OrderItem.new
		order_item.order_id = order.id
		order_item.item_id = cart_item.item.id
		order_item.quantity = cart_item.quantity
		order_item.making_status = 0
		order_item.price = (cart_item.item.price_without_tax * 1.1).floor
		order_item.save
  end
end
