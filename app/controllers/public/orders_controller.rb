class Public::OrdersController < ApplicationController
  #before_action :authenticate_customer!　最後にこちらを入れる

  def new
    @cart_items = current_customer.cart_items
    @order = Order.find(params[:id])
    @order_items = Order_item.find(order_items_params)
    redirect_to orders_path
  end
  def create
    @order = Ordrer.new
    @order.customer_id = current_customer.id
    if @order.save
      cart_item.destroy.all
      redirect_to complete_path(@order)
    end
  end
  def complete
  end
  def index
    @orders = Order.all
    # @order = @item.order.new(order_params) エラーになるのでコメントアウト
    #@shipping = Shipping.address  エラーになるので
  end
  def show
    @order= order.find(params[:id])
    @order_items = @order.order_items
  end
  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.zip_code = @address.zip_code
    @order.address = @address.address
    @order.name = @address.name
  end
  
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

  # current_customer.cart_items.destroy_all #カートの中身を削除　　エラーになるためコメントアウト


  private
  def order_params
    params.require(:order).permit(:payment_method, :name, :address, :postage, :zip_code, :total_amount, :quantity)
  end
end
