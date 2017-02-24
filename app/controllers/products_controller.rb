class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Successfully created product"
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Successfully updated product"
      redirect_to product_path(@product)
    else
      render 'edit'
    end
  end

  def destroy
    @products = Product.all
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product deleted"
    redirect_to products_path
  end
private
  def product_params
    params.require(:product).permit(:name, :description, :price, :photo)
  end
end
