class Public::CartProductsController < ApplicationController
  before_action :authenticate_user!
  #device機能を利用した時に使えるやつ。オプションはonlyとexceptがある。
  def create
    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.user_id = current_user.id
    if @cart_product.save
      redirect_to cart_products_path,success: '商品をカートに追加しました.'
    else
      @product = Product.find(@cart_product.product_id)
      render 'public/products/show' #publicディレクトリのproductsフォルダのshowページへrender。(renderするとViewが乱れるけどOK)
    end
  end

  def index
    @cart_products = CartProduct.where(user_id: current_user.id)
  end

  def update
    @cart_products = CartProduct.find(params[:id])
    if @cart_products.update(cart_product_params)
      redirect_to cart_products_path,success: '個数を変更しました'
    else
      render :index, danger: "個数の変更に失敗しました。"
    end
  end

  def destroy_all
    user = User.find(current_user.id)
    if user.cart_products.destroy_all
      redirect_to cart_products_path,success: 'カート内の商品を全て削除しました。'
    else
      render :index, danger: "カート内の商品を削除出来ませんでした。"
    end
  end

  def destroy
    @cart_products = CartProduct.find(params[:id])
    if @cart_products.destroy
    redirect_to cart_products_path,success: '商品の削除が完了しました。'
    else
      render :index, danger: "商品の削除が出来ませんでした"
    end
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:quantity,:product_id)
  end

end
