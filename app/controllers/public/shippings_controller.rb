class Public::ShippingsController < ApplicationController

  def index
    @shipping = Shipping.new
    @shippings = Shipping.all
  end

  def create
    @shipping = Shipping.new(shipping_params)
    @shipping.save
    @shippings = Shipping.all
    redirect_to shippings_path
  end

  def edit
    @shipping = Shipping.find(params[:id])
  end

  def update
    @shipping = Shipping.find(params[:id])
    @shipping.update(shipping_params)
    @shippings = Shipping.all
    redirect_to shippings_path
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
