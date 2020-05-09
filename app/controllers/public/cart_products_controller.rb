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
  end

  def update
  end

  def destroy_all
  end

  def destroy
  end

  private
  def cart_product_params
    params.require(:cart_product).permit(:quantity, :product_id)
  end
end
