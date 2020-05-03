class Admin::OrdersController < ApplicationController
  def index
    @order_histories = OrderHistory.page(params[:page]).per(10)
  end

  def show
  end

  def order_update
  end

  def work_update
  end
end
