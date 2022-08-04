class PurchasesController < ApplicationController
  def index 
    @purchases = Purchase.all
  end

  def show 
    @purchase = Purchase.find(params[:id])
    authorize @purchase
    @products = @purchase.products
  end 

  def new 
    @purchase = Purchase.new
    authorize @purchase
    @products = Product.pluck(:name)
  end 

  def create 

    @purchase = Purchase.new(purchase_params)
    authorize @purchase
     params[:purchase][:products].each do |name|
       product = Product.find_by(name: name)
        @purchase.products << product
      end

    if @purchase.save 
      flash[:notice] = "Purchase successful"
      redirect_to @purchase
    else 
      render :new 
    end 
  end 

  def edit
    @purchase = Purchase.find(params[:id])
    authorize @purchase
    @products = Product.pluck(:name)
  end 

  def update
    @purchase = Purchase.find(params[:id])
    authorize @purchase
    @purchase.products.destroy_all
    params[:purchase][:products].each do |name|
      product = Product.find_by(name: name)
        @purchase.products << product
    end
    if @purchase.update(purchase_params)
      flash[:notice] = "Invoice successfully updated"
      redirect_to purchase_path
    else 
      render :edit 
    end
  end 

  def destroy 

    @purchase = Purchase.find(params[:id])
    authorize @purchase
    @purchase.destroy
    flash[:notice] = "Invoice removed"
    redirect_to root_path
  end
 

private
    def purchase_params
      params.require(:purchase).permit(:invoice, :product_id, :products, :purchases, :purchase_id, :price)
    end  
end 


