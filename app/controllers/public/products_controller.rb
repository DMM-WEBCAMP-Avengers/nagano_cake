class Public::ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page]).per(8)
    @quantity = Product.count
  end

  def show
    @product = Product.find(params[:id])
    # @cart_product = Cart_product.new  errorが出る
  end
end