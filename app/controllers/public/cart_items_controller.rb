class Public::CartItemsController < ApplicationController

  def index
    # @cart_items = current_user.cart_items　←最終こうなるハズ
    @total_amount = 0
  end

  def create
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
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
