class Public::ItemsController < ApplicationController

  def index
  end


  def show



    # 『カートに入れる』form_with用インスタンスの定義
    @item = Item.find(params[:id])
    if current_customer.cart_items.find_by(item_id:params[:id]).present?
      @cart_item = current_customer.cart_items.find_by(item_id:params[:id])
    else
      @cart_item = CartItem.new
    end
  end

end
