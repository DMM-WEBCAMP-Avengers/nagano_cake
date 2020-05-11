class Public::UsersController < ApplicationController
  def top
    @products = Product.all.shuffle.first(4)
  end

  def edit
    @user = current_user
  end

  def show
    @user = User.find(current_user.id)
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to "/user"
    else
      render action: :edit
    end
  end

  def destroy
    user = current_user
    user.update(validation: false)
    #update後にログアウトしたい。
    sign_out user
    redirect_to root_path, success: "退会処理が完了しました。"
  end

  def cancel
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :email, :postal_code, :address, :phone_number)
  end
end
