class Admin::OrdersController < ApplicationController
  def index
    params[:prev_path] ? @path = params[:prev_path].permit! : @path = Rails.application.routes.recognize_path(request.referer)
    if @path[:controller] == "admin/users"
      case @path[:action]
        when "top"
          #最初の表示は行けるが、ページネーションで他のページに行くとエラーが出る。
          @order_histories = OrderHistory.where(created_at: Time.zone.today.all_day).order(created_at: "DESC").page(params[:page]).per(10)
        when "show"
          @user_id = params[:user_id]
          @order_histories = OrderHistory.where(user_id: params[:user_id]).order(created_at: "DESC").page(params[:page]).per(10)
      end
    else
      @order_histories = OrderHistory.order(created_at: "DESC").page(params[:page]).per(10)
    end
  end

  def show
  end

  def order_update
  end

  def work_update
  end
end
