class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all # ログイン機能使えるまで 実装用 仮インスタンス
    # @cart_items = current_customer.cart_items　←最終こうなるハズ
    @total_amount = 0
  end

  def create # items#show からのみ
    # cart_item = current_customer.cart_items.new(cart_item_params)
    # cart_item.save
    redirect_to items_path
  end

  def update # items#show　または　cart_items#show　からの2パターン
    cart_item = CartItem.find(params[:id])
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
    params.require(:cart_item).permit(:quantity, :item_id)
  end
end
