class Admin::OrdersController < ApplicationController

  include ApplicationHelper

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
    @order_history = OrderHistory.find(params[:order_history_id])
    @ordered_products = @order_history.ordered_products
  end

  def order_update
    @order_history = OrderHistory.find(params[:order_history_id])
    if @order_history.update( params_int(order_history_params) )
      #このupdateにより製作ステータスを変更する必要が無いか確認し、必要があれば変更・保存。
      #auto_update_work_statusはorder_history.rbに定義しています。
      @order_history.auto_update_work_status
      redirect_to "/admin/orders/#{@order_history.id}", success: "注文ステータスの更新が完了しました。"
    else
      @ordered_products = @order_history.ordered_products
      render action: :show, danger: "注文ステータスの更新に失敗しました。"
    end
  end

  def work_update
    @ordered_product = OrderedProduct.find(params[:ordered_product_id])
    @order_history = OrderHistory.find(@ordered_product.order_history.id)
    if @ordered_product.update( params_int(ordered_product_params) )
      #このupdateにより注文ステータスを変更する必要が無いか確認し、必要があれば変更・保存。
      #auto_update_order_statusはordered_product.rbに定義しています。
      @ordered_product.auto_update_order_status
      redirect_to "/admin/orders/#{@order_history.id}", success: "製作ステータスの更新が完了しました。"
    else
      @ordered_products = @order_history.ordered_products
      render action: :show, danger: "製作ステータスの更新に失敗しました。"
    end
  end

  private

  #integerで渡してもparamsではstringになってしまう。
  def order_history_params
    params.require(:order_history).permit(:order_status)
  end

  def ordered_product_params
    params.require(:ordered_product).permit(:work_status)
  end

  #数値に変換可能なparamsをintegerに変換してくれる
  def params_int(model_params)
    model_params.each do |key, value|
      #数値に変換可能かを確認(application_helper.rbに定義してあります。)
      if integer_string?(value)
        #数値に変換
        model_params[key]=value.to_i
      end
    end
  end
end
