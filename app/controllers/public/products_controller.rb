class Public::ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page]).per(8)
    @quantity = Product.count
  end

  def show
    @product = Product.find(params[:id])
    @ordered_product = Ordered_product.new
  end
end
