class Public::DestinationsController < ApplicationController
  def index
  end

  def cerate
  end

  def edit
    @user =User.find(params[:id])
  end

  def update
    if
      @user.update(current_user)
      redirect_to destinations_path(@user.id)
    else
       render :edit
      end
  end

  def destroy
  end
  private
  def user_params
    params.require(:user).permit(:postal_code, :address, :address)  #addressカラムがない
  end
end
