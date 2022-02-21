class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all # ログイン機能使えるまで 実装用 仮インスタンス
    # @cart_items = current_user.cart_items　←最終こうなるハズ
    @total_amount = 0
  end

  def create
    # if current_user.cart_items.find_by(item_id:)
    # current_user.cart_items.new()
  end

  def update
    cart_item = CartItem.find(params[:id])
    # cart_item.quantity = params[:quantity]
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    # current_user.cart_items.destroy_all ←最終こうなるはず
    redirect_to cart_items_path
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
