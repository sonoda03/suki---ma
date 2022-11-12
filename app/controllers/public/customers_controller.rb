class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def account
    # @customer = Customer.find(params[:customer_id])
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = '会員情報を更新しました。'
      redirect_to customer_account_path
    else
      render 'edit'
    end
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :first_name_kana, :last_name_kana, :nickname, :email, :introduction, :profile_image)
  end
end

