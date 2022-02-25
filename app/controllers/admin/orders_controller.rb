class Admin::OrdersController < ApplicationController
  def show
    # 注文内容の情報を取得しています！
  	@order = Order.find(params[:id])
    # 注文内容の商品を取得しています！
  	@order_items = @order.order_items
  	@total = 0
  	@order_items.each do |order_item|
      @total += order_item.item.with_tax_price*order_item.quantity
    end

  end

  def update
    #binding.pry
    order = Order.find(params[:id])
    # status = params[:order][:status].to_i
    order.update(order_params)

    if order.order_status == "入金確認" #注文ステータスが入金確認なら下の事をする
      @order_items = order.order_items
	    @order_items.update_all(item_status: 1) #製作ステータスを「製作待ちに」　更新

    # elsif order.item_status == "3" #製造ステータスが製造完了なら下の事をする
    #   @order_items = order.order_items
	  #   @order_items.update_all(order_status: 3) #注文ステータスを「発送準備中に」　更新
    end

    redirect_to  admin_order_path(order) #注文詳細に遷移
  end

  private

  def order_params
  	params.require(:order).permit(:order_status)
  end
end
