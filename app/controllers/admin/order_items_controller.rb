class Admin::OrderItemsController < ApplicationController
	# before_action :authenticate_admin!

	def update
  	@order_item = OrderItem.find(params[:id]) #　特定
		@order = @order_item.order #注文商品から注文テーブルの呼び出し（何度も呼び出すのは処理が増える為）
		@order_item.update(order_item_params) #　製作ステータスの更新
		if @order_item.item_status == "製作中" #製作ステータスが「製作中」なら入る
			@order.update(order_status: 2) #注文ステータスを「製作中」　に更新
		elsif @order.order_items.count ==  @order.order_items.where(item_status: "製作完了").count
			@order.update(order_status: 3) #注文ステータスを「発送準備中]に更新
		end
		redirect_to admin_order_path(@order_item.order) #注文詳細に遷移
	end



  # def cart_items
  #   cart_items = current_customer.cart_items
		# cart_items.each do |cart_item|
		# order_item = OrderItem.new
		# order_item.order_id = order.id
		# order_item.item_id = cart_item.item.id
		# order_item.quantity = cart_item.quantity
		# order_item.making_status = 0
		# order_item.price = (cart_item.item.price_without_tax * 1.1).floor
		# order_item.save
  # end
  private

  def order_item_params
    params.require(:order_item).permit(:item_status)
  end

end
