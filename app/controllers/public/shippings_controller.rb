class Public::ShippingsController < ApplicationController

  def index
    @shipping = Shipping.new
    @shippings = Shipping.all
  end

  def create
    @shipping = Shipping.new(shipping_params)
    @shipping.customer_id = current_customer.id
    if @shipping.save
      flash[:notice] = "新しい配送先を登録しました"
      redirect_to shippings_path
    else
      @shippings = Shipping.all
      render :index
    end
  end

  def edit
    @shipping = Shipping.find(params[:id])
  end

  def update
    @shipping = Shipping.find(params[:id])
    if @shipping.update(shipping_params)
      flash[:notice] = "配送先情報を更新しました"
      redirect_to shippings_path
    else
      render :edit
    end
  end

  def destroy
    @shipping = Shipping.find(params[:id])
    if @shipping.destroy
      flash[:notice] = "1件の配送先を削除しました"
      redirect_to shippings_path
    end
  end

  private

  def shipping_params
    params.require(:shipping).permit(:zip_code,:address,:name)
  end
end
