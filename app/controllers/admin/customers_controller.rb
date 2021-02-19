class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @customers = Customer.page(params[:page]).reverse_order
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:success] = '会員情報の更新に成功しました！'
      redirect_to admin_customer_path(@customer)
    else
      flash[:danger] = '内容に不備があります！'
      render :edit
    end  
  end
  
  # 会員情報の更新ストロングパラメータ
  private
  
  def customer_params
    params.require(:customer).permit(
      :last_name, 
      :first_name, 
      :last_name_kana, 
      :first_name_kana,
      :email,
      :encrypted_password,
      :postal_code,
      :address,
      :telephone_number,
      :is_active
    )
  end
  
end
