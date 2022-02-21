class Public::ItemsController < ApplicationController

  def index
  end


  def show



    # # ↓ショータ記述 『カートに入れる』form_with用インスタンスの定義 ログイン機能完成後にコメントアウト解除
    # if current_customer.cart_items.find_by(item_id:params[:id]).exists?
    #   @cart_item = current_customer.cart_items.find_by(item_id:params[:id])
    # else
    #   @cart_item = current_customer.cart_items.new(item_id:params[:id]) ←無理かも
    #   @cart_item = CartItem.new ←コッチかも
    # end
  end

end
