class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
    @restaurants = @user.restaurants
  end

  def update #what does this do?
    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end
 
  def new
    @user = User.new
  end

  def edit
  end

  # def destroy
  #   @user = User.find(params[:id])
  #   @user.destroy
  #   redirect_to root_path, notice: 'User deleted'
  # end

private #what does any of this stuff do?
    
  def user_params
    params.require(:user).permit(:picture)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def validate_authorization_for_user
     redirect_to root_path unless @user == current_user
  end
end