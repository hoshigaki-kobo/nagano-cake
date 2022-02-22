class Admin::HomesController < ApplicationController
  def top
    @order = Order.all
    @order = Order.page(params[:page])

  end
end
