class Public::ProductsController < ApplicationController
  def index
    @products = Product.joins(:genre).where(genres: { validation: true }).page(params[:page]).per(8)
    @quantity = Product.count
  end

  def show
    @product = Product.find(params[:id])
    @cart_product = CartProduct.new #Cart_product.new キャメルケースを利用
  end
end
