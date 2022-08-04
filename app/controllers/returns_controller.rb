class ReturnsController < ApplicationController
  def create 
    @return = Return.new(return_params)
    if @return.save 
      redirect_to @return.purchase
    else 
      render @return.purchase
    end  
  end 

private
  def return_params
    params.permit(:purchase_id, :product_id)
  end 
end 