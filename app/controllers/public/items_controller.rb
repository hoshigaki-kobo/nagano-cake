class Public::ItemsController < ApplicationController

  def index
    @items = Item.where(is_active: true).page(params[:page])
    @genres = Genre.all

  end

  def show
    @genres = Genre.all
    # 『カートに入れる』form_with用インスタンスの定義
    @item = Item.find(params[:id])
     if customer_signed_in?
      if current_customer.cart_items.find_by(item_id:params[:id]).present?
        @cart_item = current_customer.cart_items.find_by(item_id:params[:id])
      else
        @cart_item = CartItem.new
      end
     end
  end
end
