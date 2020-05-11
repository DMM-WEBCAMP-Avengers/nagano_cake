class Public::CartProductsController < ApplicationController
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
      flash[:notice] = '個数を変更しました'
      redirect_to cart_products_path
    else
      flash[:notice] = 'error'
      render :index
    end
  end

  def destroy_all
    user = User.find(current_user.id)
    if user.cart_products.destroy_all
      flash[:notice] = "カート内の商品を全て削除しました。"
      redirect_to cart_products_path
    else
      flash[:notice] = 'error'
      render :index
    end
  end

  def destroy
    @cart_products = CartProduct.find(params[:id])
    if @cart_products.destroy
      flash[:notice] = "商品の削除が完了しました。"
    redirect_to cart_products_path
    else
      flash[:notice] = 'error'
      render :index
    end
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:quantity,:product_id)
  end

end
