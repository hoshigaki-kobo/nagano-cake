class Public::CustomersController < ApplicationController

  #before_action :authenticate_customer!

  def show
    @customer = Customer.find(params:[id])
    if @customer.id != current_customer.id
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  private

  def customer_params
    params.repuire(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :zip_code, :address, :tel)
  end

end
