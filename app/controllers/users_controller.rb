class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all 
  end

  def show 
    @user = User.find(params[:id])
    authorize @user
  end

  def new 
    @user = User.new
    authorize @user
  end 

  def create
    @user = User.new(user_params)
    authorize @user

    if @user.save
      redirect_to users_path
    else 
      render :new
    end 
  end 

  def edit
    @user = User.find(params[:id])
    authorize @user
  end 

  def update

    @user = User.find(params[:id])
    authorize @user

    if @user.update(user_params)
      flash[:notice] = "User details updated"
      redirect_to users_path
    else
      render :edit
    end 
  end 

  def destroy
    @user = User.find(params[:id])
    authorize @user
    @user.destroy
    flash[:notice] = "User removed"
    redirect_to root_path
  end 

private
  def user_params
    params.require(:user).permit(:email, :password, :role, :name)
  end 
end 


