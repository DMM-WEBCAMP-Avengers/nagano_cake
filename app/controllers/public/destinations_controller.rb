class Public::DestinationsController < ApplicationController
  def index
  end

  def cerate
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
  end

  private
  def destination_params
    params.require(:destination).permit(:postal_code, :address, :addressee)
  end
end