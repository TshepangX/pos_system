class ProductsController < ApplicationController

  def index 
    @products = Product.all
  end

  def show 
    @product = Product.find(params[:id])
    @purchases = @product.purchases
    @purchase = @product.price
  end 

  def new 
    @product = Product.new
    authorize @product
  end 

  def create  
    @product = Product.new(product_params)
    authorize @product
  
    if @product.save 
      flash[:notice] = "Product successfully created"
      redirect_to products_path
    else 
      render :new 
    end 
  end 

  def edit
    @product = Product.find(params[:id])
    authorize @product
  end 

  def update
    @product = Product.find(params[:id])
    authorize @product

    if @product.update(product_params)
      flash[:notice] = "Product successfully updated"
      redirect_to product_path
    else 
      render :edit 
    end
  end 

  def destroy 
    @product = Product.find(params[:id])
    authorize @product
    @product.destroy
    flash[:notice] = "Product removed"
    redirect_to root_path
  end

private
  def product_params
    params.require(:product).permit(:name, :description, :products, :product_id, :purchases, :purchase_id, :invoice, :price, :stock)
  end 
end 

