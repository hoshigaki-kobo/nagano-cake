class Admin::OrdersController < ApplicationController
  def update
    order = Order.find(params[:id])
    status = params[:order][:status].to_i
    order.update(status: status)
    redirect_to admin_order_path(order)
  end
end
