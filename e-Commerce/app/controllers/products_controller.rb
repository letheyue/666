class ProductsController < ApplicationController

  def product_params
    params.require(:product).permit(:name, :price, :comment)
  end

  def new
  end

  def create
    @product = Product.create!(product_params)
    flash[:notice] = "#{@product.name} was successfully created."
    redirect_to products_path
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product '#{@product.name}' deleted."
    redirect_to products_path
  end

  def edit
    @product = Product.find params[:id]
  end

  def update
    @product = Product.find params[:id]
    @product.update_attributes!(product_params)
    flash[:notice] = "#{@product.name} was successfully updated."
    redirect_to products_path(@product)
  end

  def index
    @products = Product.all.order("name ASC")
    if params[:search]
      @products = Product.search(params[:search]).order("name ASC")
    end
  end
end
