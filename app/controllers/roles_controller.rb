class RolesController < ApplicationController
    before_action :authenticate_user!
  
    def new 
      @user = User.new
      authorize @user
    end 
  
    def create
      @user = User.new(user_params)
      authorize @user
  
      if @user.save
        flash[:notice] = "User successfully added"
        redirect_to users_path
      else 
        render :new
      end 
    end 
  
  
  private
    def user_params
      params.permit(:email, :password, :role, :name)
    end 
  end 
  
  
  
