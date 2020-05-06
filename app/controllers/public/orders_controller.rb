class Public::OrdersController < ApplicationController
  def new
  end

  def create
  end

  def confirmation
  end

  def finish
  end

  def index
  end

  def show
    @order_history = OrderHistory.find(params[:id])
    @ordered_products = @order_history.ordered_products
  end
end
