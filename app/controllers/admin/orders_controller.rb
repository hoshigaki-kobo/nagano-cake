class Admin::OrdersController < ApplicationController
  def show
    # 注文内容の情報を取得しています！
  	@order = Order.find(params[:id])
    # 注文内容の商品を取得しています！
  	@order_items = @order.order_items
  	@total = 0
  end

  def update
    order = Order.find(params[:id])
    status = params[:order][:status].to_i
    order.update(order_params)

    if order.order_status == "入金確認" #注文ステータスが入金確認なら下の事をする
       @order_items = order.order_items
	     @order_items.update_all(item_status: 1) #製作ステータスを「製作待ちに」　更新
    end
  		 redirect_to  admin_order_path(order) #注文詳細に遷移
    # redirect_to admin_order_path(order)

  end
  def order_params
  	params.require(:order).permit(:order_status)
  end
end
