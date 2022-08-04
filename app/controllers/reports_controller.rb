class ReportsController < ApplicationController
 
  def index
    if params[:start_date].blank? && params[:end_date].blank?
        @purchases = Purchase.all
        
      else 
        start_date, end_date = params[:start_date].to_date, params[:end_date].to_date
        @purchases = Purchase.where(created_at: start_date...end_date)   
    end
  end
end
