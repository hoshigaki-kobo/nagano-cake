class Public::OrdersController < ApplicationController
  #before_action :authenticate_customer!最後にこちらを入れる
  # before_action :request_post?, only: [:confirm]
  # before_action :order_new?, only: [:new]


  def new
    @order = Order.new
    # @shipping = Shipping.address
  end

  def confirm
    @order = Order.new(order_params)
    #new画面から渡ってきたデータ @orderに入れます
    if params[:order][:address_number] == "0"
        #viewで定義しているaddress_numberが"0"だったときにこの処理を実行します
        #form_with で @order で送っているので、order に紐付いた address_number となります。以下同様です
      # @address = Address.find(params[:order][:address_id])
      @order.zip_code = current_customer.zip_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name
    elsif params[:order][:address_number] == "1"
      #view で定義しているaddress_number が"1"だったときにこの処理を実行します
      if Address.exists?(name: params[:order][:shipping])
        #registered は viweで定義しています
        @order.zip_code = @address.find(params[:zip_code][:shipping]).zip_code
        @order.name = Address.find(params[:order][:shipping]).name
        @order.address = Address.find(params[:order][:shipping]).address
      else
        render :new
        #既存のデータを使ってoriありえないですが、万が一データが足りない場合は new を render します
      end
    elsif params[:order][:address_nnmber] == "2"
      #viewで定義している address_numberが"2"だったときにこの処理を実行します
      address_new = current_customer.addresses.new(address_params)
      if address_new.save # 確定前(確認画面)で save してしまうことになりますが、私の知識の限界でした
      else
        render :new
        #ここに渡ってくるデータはユーザーで新規追加してもらうので、入力不足の場合はnewに戻します
      end
    else
      # redirect_to 'top'
    end
    @cart_items = current_customer.cart_items.all # カートアイテムの情報をユーザーに確認してもらうために使用します
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_price }
    # 合計金額を出す処理です sum_price はモデルで定義したメソッドです
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = Ordrer.new
    @order.customer_id = current_customer.id

    if @order.save
      cart_item.destroy.all
      redirect_to complete_path(@order)
    end
  end

  def complete
  end

  def index
    @orders = Order.all
    # @order = @item.order.new(order_params) エラーになるのでコメントアウト
    #@shipping = Shipping.address  エラーになるので
  end

  def show
    # @order = Order.find(params[:id]) #order特定
    # @order_item = @order.order_items #特定したorserからorder_items全部取得
    @total = 0 #変数提議　合計を計算する変数
    # @order_items = @order.order_items
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :name, :address, :postage, :zip_code, :item_id, :total_amount, :quantity)
  end

  def shipping_params
    params.require(:order).permit(:zip_code, :address, :name)
  end
end
