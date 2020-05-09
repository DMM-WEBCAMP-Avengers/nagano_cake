class Admin::UsersController < ApplicationController
  def top
    @order_histories = OrderHistory.where(created_at:  Time.zone.now.all_day)
  end

  def index
    @users = User.all
    @users = User.page(params[:page]).per(10)
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to admin_user_path(@user.id)
    else
      render action: :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_id, :validation, :first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :address, :phone_number, :email)
  end
end

