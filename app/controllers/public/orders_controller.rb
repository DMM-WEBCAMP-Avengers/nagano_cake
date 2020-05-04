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
    @order_histories = OrderHistory.where(user_id: current_user.id)
  end

  def show
  end
end
