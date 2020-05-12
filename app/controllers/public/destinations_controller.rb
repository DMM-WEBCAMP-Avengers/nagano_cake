class Public::DestinationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @destination = Destination.new
    @destinations = Destination.where(user_id: current_user.id)
  end

  def create
    @destination = Destination.new(destination_params)
    @destination.user_id = current_user.id
    if @destination.save
      redirect_to destinations_path, success: "配送先の新規登録が完了しました。"
    else
      @destinations = Destination.where(user_id: current_user.id)
      render action: :index
    end
  end

  def edit
    @destination =Destination.find(params[:id])
  end

  def update
    @destination =Destination.find(params[:id])
    if @destination.update(destination_params)
      redirect_to destinations_path(@destination.id)
    else
      render :edit
      end
  end

  def destroy
    @destination = Destination.find(params[:id])
    @destination.destroy
    redirect_to destinations_path, success: "配送先の削除が完了しました。"
  end

  private
  def destination_params
    params.require(:destination).permit(:postal_code, :address, :addressee)
  end

  private
  def destination_params
    params.require(:destination).permit(:postal_code, :address, :addressee)
  end
end
