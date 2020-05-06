class Admin::OrdersController < ApplicationController
  def index
    #ページネーションで飛んできた時は@pathをparams[:prev_path]から取り、他のページから遷移してきた時はrequest.refererから@pathを取得。
    #params[:prev_path]がハッシュだからなのか、普通に@path = params[:prev_path]とするとunpermitted_paramsとしてエラーが出る。ひとまず.permit!を付けて解決。
    params[:prev_path].nil? ? @path = Rails.application.routes.recognize_path(request.referer) : @path = params[:prev_path].permit!

    #@pathの中身で遷移元のページを判断
    if @path[:controller] == "admin/users"
      case @path[:action]
        when "top"
          #.all_dayでその日の始めから終わりまで、という検索ができるとのこと。
          #order(created_at: "DESC")で日付降順に
          @order_histories = OrderHistory.where(created_at: Time.zone.today.all_day).order(created_at: "DESC").page(params[:page]).per(10)
        when "show"
          #ページネーションで飛んできた時はparams[:user_id]から以前のuser_idを使い回す。
          @user_id = params[:user_id]
          @order_histories = OrderHistory.where(user_id: params[:user_id]).order(created_at: "DESC").page(params[:page]).per(10)
      end
    else
      #ヘッダーから飛んできた場合の処理に該当。全ての履歴を取ってくる。
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
