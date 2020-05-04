class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def index
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_product_path(@product.id)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def show
  end

  def update
    @product = Product.find(product[:id])
  end

  private
  def product_params
    params.require(:product).permit(:image, :name, :introduction, :genre_id, :price, :validation)
  end
end
