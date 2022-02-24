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
      if Shipping.exists?(id: params[:order][:shipping_id])
        #registered は viweで定義しています
        @order.zip_code = Shipping.find(params[:order][:shipping_id]).zip_code
        @order.name = Shipping.find(params[:order][:shipping_id]).name
        @order.address = Shipping.find(params[:order][:shipping_id]).address
      else
        render :new
        #既存のデータを使っておりありえないですが、万が一データが足りない場合は new を render します
      end
    elsif params[:order][:address_nnmber] == "2"
      #viewで定義している address_numberが"2"だったときにこの処理を実行します
      address_new = current_customer.addresses.new(address_params)
      if address_new.save # 確定前(確認画面)で save してしまうことになります
      else
        render :new
        #ここに渡ってくるデータはユーザーで新規追加してもらうので、入力不足の場合はnewに戻します
      end
    end

    @cart_items = current_customer.cart_items.all # カートアイテムの情報をユーザーに確認してもらうために使用します
    @total = 0 #変数提議　合計を計算する変数
    @cart_items.each do |cart_item|
      @total += cart_item.quantity*cart_item.item.tax_included
      @total_amount = @total + 800
    end
    @order.total_amount = @total_amount
    @order.order_status = 0
    # @total = @cart_items.inject(0) { |sum, item| sum + item.total_amount }
    # 合計金額を出す処理です sum_price はモデルで定義したメソッドです
  end

  def create
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.postage = 800

    if @order.save
        @cart_items = current_customer.cart_items.all
          @cart_items.each do |cart_item|
          @order_items = @order.order_items.new
          @order_items.item_id = cart_item.item.id
          @order_items.item.name = cart_item.item.name
          @order_items.tex_excluded = cart_item.item.tax_included
          @order_items.quantity = cart_item.quantity
          @order_items.save
        end
       @cart_items.destroy_all
      redirect_to complete_path(@order)
    end
  end

  def complete
  end

  def index
    # binding.pry
    @orders = Order.all
    # @order = @item.order.new(order_params) エラーになるのでコメントアウト
    #@shipping = Shipping.address  エラーになるので
  end

  def show
    @customer = Customer.all
    @order = Order.find(params[:id]) #order特定
    @order_item = @order.order_items #特定したorserからorder_items全部取得
    @total = 0 #変数提議　合計を計算する変数
    # @order_items = @order.order_items
  end

  private
  def order_params
    params.require(:order).permit(:payment, :name, :address, :postage, :zip_code, :item_id, :total_amount, :quantity, :order_status)
  end

  def shipping_params
    params.require(:order).permit(:zip_code, :address, :name)
  end
end
