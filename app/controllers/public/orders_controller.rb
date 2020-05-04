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
    @ordered_products = OrderedProduct.where(order_history_id: params[:id])
  end
end
