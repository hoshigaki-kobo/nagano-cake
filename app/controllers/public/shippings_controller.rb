class Public::ShippingsController < ApplicationController

  def index
    @shipping = Shipping.new
    @shippings = Shipping.all
  end

  def cerate
    shipping = Shipping.new(shipping_params)
    shipping.save
  end

  def edit
    @shipping = Shipping.find(params[:id])
  end

  def update
    @shipping = Shipping.find(params[:id])
    @shipping.update
  end

  def destory
    @shipping = Shipping.find(params[:id])
    @shipping.destory
  end

  private

  def shipping_params
    params.require(:shipping).permit(:zip_code,:address,:name)
  end
end
