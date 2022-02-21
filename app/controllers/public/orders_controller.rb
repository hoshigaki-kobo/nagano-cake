class Public::OrdersController < ApplicationController
  #before_action :authenticate_customer!最後にこちらを入れる

  def new
    @order = Order.new
    # @shipping = Shipping.address
  end

  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.zip_code = @address.zip_code
    @order.address = @address.address
    @order.name = @address.name
  end

  def create
    cart_items = current_customer.cart_items.all
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
    # @order= order.find(params[:id])
    # @order_items = @order.order_items
  end

  # current_customer.cart_items.destroy_all #カートの中身を削除エラーになるためコメントアウト


  private
  def order_params
    params.require(:order).permit(:payment_method, :name, :address, :postage, :zip_code, :item_id, :total_amount, :quantity)
  end

  def shipping_params
    params.require(:order).permit(:zip_code, :address, :name)
  end
end
