class Admin::UsersController < ApplicationController
  def top
  end

  def index
  end

  def edit
  end

  def show
    @user = current_user
    @user = User.find(params[:id])
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:user_id, :validation :first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :address, :phone_number, :email)
  end
end
