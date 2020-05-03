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
    @orders = OrderHistory.where(user_id: current_user.id)
    @products = Product.all
  end

  def show
  end
end
