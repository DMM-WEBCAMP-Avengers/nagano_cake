class Public::OrdersController < ApplicationController
  def new
    @order_history = OrderHistory.new
  end

  def create
  end

  def confirmation
    @cart_products = CartProduct.where(user_id: current_user.id)
    @order_history = OrderHistory.where(user_id: current_user.id)
    # @order_history = current_user.order_histories.find(order_history_params)
    # @order_history = @cart_products.user_id.find(current_order_history)
  end

  def finish
  end

  def index
    @order_histories = OrderHistory.where(user_id: current_user.id)
  end

  def show
    @order_history = OrderHistory.find(params[:id])
    @ordered_products = @order_history.ordered_products
  end

  private

  def order_history_params
    params.require(:order_history).permit(:payment_option, :postage, :billing, :addressee, :postal_code, :address)
  end
end
