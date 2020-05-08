class Public::OrdersController < ApplicationController
  def new
  end

  def create
  end

  def confirmation
    @cart_products = CartProduct.where(user_id: current_user.id)
    @order_histories = OrderHistory.where(user_id: current_user.id)
    # @order_histories = current_user.order_histories.find(order_history_params)
    # @order_histories = @cart_products.user_id.find(current_order_history)
    @ordered_products =
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
