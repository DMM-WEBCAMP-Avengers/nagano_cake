class Public::ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page]).per(8)
    @quantity = Product.count
    @genres = Genre.where(validation: true)
  end

  def show
    @product = Product.find(params[:id])
    @cart_product = CartProduct.new #Cart_product.new キャメルケースを利用
    @genres = Genre.where(validation: true)
  end
end
