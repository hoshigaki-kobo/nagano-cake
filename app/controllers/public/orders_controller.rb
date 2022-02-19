class Public::OrdersController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    @order = @item.order.new(order_params)
  end

  def create
    @item = Item.find(params[:item_id])
    @order = @item.order.new(order_params)
    @order.save
    
    redirect_to items_path
  end

  def complete
  end

  def index
    @orders = Order.all
    @order = @item.order.new
    @shipping = shipping.address
  end

  def show
    @item = Item.find(params[:item_id])
    @order = @item.order.new
  end


  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.zip_code = @address.zip_code
    @order.address = @address.address
    @order.name = @address.name
  end
  
  current_member.cart_items.destroy_all #カートの中身を削除
  redirect_to public_orders_thanks_path #thanksに遷移

  private
  def order_params
    params.require(:order).permit(:payment_method, :name, :address, :postage, :zip_code, :total_amount, :quantity)
  end
end
