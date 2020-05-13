class Public::OrdersController < ApplicationController
  before_action :authenticate_user!

  include ApplicationHelper

  def new
    @order_history = OrderHistory.new
  end

  def create
    if @order_history = OrderHistory.create(params_int(order_history_params))
      @cart_products = CartProduct.where(user_id: current_user.id)
        @cart_products.each do |cart_product|
          # 購入商品テーブルにレコード追加する
          @ordered_products = OrderedProduct.create(
            product_id: cart_product.product.id,
            order_history_id: @order_history.id,
            price: cart_product.product.price,
            quantity: cart_product.quantity
            )
        end
      # 購入確定したらカートを削除する
      @cart_products.destroy_all
      case params[:order_history][:radio_number].to_i
      when 1 #自分の住所
      when 2#登録された住所から選択
      when 3#新規作成の住所
        #新規住所登録
        @destination = Destination.create(
          user_id: current_user.id, 
          addressee: params[:order_history][:addressee],
          postal_code: params[:order_history][:postal_code],
          address: params[:order_history][:address]
          )
      end
      redirect_to finish_orders_path, success: '購入成功しました.'
    else
      render :confirmation, notice: '購入に失敗しました'
    end
  end

  def confirmation
      @cart_products = CartProduct.where(user_id: current_user.id)
      @postage = 800
      @tax = 1.1
    if params[:order_history][:payment_option].nil?
      params[:order_history][:payment_option] = 
        case params[:order_history][:radio_number].to_i
        when 1 ##自分の住所
          destination_when1
        when 2 ##登録された住所から選択
          destination_when2
        when 3 
          destination_when3
        when 0 ##お届け選択無し
          destination_when0
        end
      @order_history.valid?
      render action: :new, notice: '支払い方法が選択されていません'
    else
      case params[:order_history][:radio_number].to_i
      when 1 ##自分の住所
        destination_when1
        @order_history.payment_option = params[:order_history][:payment_option].to_i
      when 2 ##登録された住所から選択
        destination_when2
        @order_history.payment_option = params[:order_history][:payment_option].to_i
      when 3 
        destination_when3
        @order_history.payment_option = params[:order_history][:payment_option].to_i
      when 0 ##お届け選択無し
        destination_when0
      end

      if @order_history.valid?
      else
      render action: :new, notice: '配送先が選択されていません'
      end

    end
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

  def destination_when1
    ##自分の住所
    @order_history = OrderHistory.new(
    user_id: current_user.id,
    addressee: current_user.last_name + current_user.first_name,
    postal_code: current_user.postal_code,
    address: current_user.address,
    billing: @cart_products.map{ |cp| (cp.product.price*cp.quantity * @tax) }.sum.round + @postage
    )
  end

  def destination_when2
    ##登録された住所から選択
    destination = Destination.find(params[:order_history][:destination_id])
    @order_history = OrderHistory.new(
      user_id: current_user.id,
      addressee: destination.addressee,
      postal_code: destination.postal_code,
      address: destination.address,
      billing: @cart_products.map{ |cp| (cp.product.price*cp.quantity * @tax) }.sum.round + @postage
    )
  end

  def destination_when3
    ##新規作成の住所
    @order_history = OrderHistory.new(
      user_id: current_user.id,
      addressee: params[:order_history][:addressee],
      postal_code: params[:order_history][:postal_code],
      address: params[:order_history][:address],
      radio_number: params[:order_history][:radio_number].to_i,
      billing: @cart_products.map{ |cp| (cp.product.price*cp.quantity * @tax) }.sum.round + @postage
      )
  end

  def destination_when0
    @order_history = OrderHistory.new(
      user_id: current_user.id,
      billing: @cart_products.map{ |cp| (cp.product.price*cp.quantity * @tax) }.sum.round + @postage
      )
  end


  def order_history_params
    params.require(:order_history).permit(:user_id, :addressee, :postal_code, :address,
    :payment_option, :postage, :billing, :destination_id, :radio_number)
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
