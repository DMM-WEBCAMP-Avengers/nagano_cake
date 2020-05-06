class Admin::OrdersController < ApplicationController

  include ApplicationHelper

  def index
    @order_histories = OrderHistory.page(params[:page]).per(10)
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
      redirect_to "/admin/orders/#{@order_history.id}", success: "制作ステータスの更新が完了しました。"
    else
      @ordered_products = @order_history.ordered_products
      render action: :show, danger: "制作ステータスの更新に失敗しました。"
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
