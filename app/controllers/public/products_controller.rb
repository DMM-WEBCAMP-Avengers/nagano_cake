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

  def search
    @genre = Genre.find_by(name: params[:genre_name])
    @products = Product.where(genre_id: @genre.id).page(params[:page]).per(8)
    @quantity = @products.size
    @genres = Genre.where(validation: true)
    render 'public/products/index'
  end
end
