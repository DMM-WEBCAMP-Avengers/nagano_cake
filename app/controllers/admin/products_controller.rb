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
  end

  def show
    @product = Product.find(params[:id])
  end

  def update
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :introduction, :genre, :price, :validation)
  end

end
