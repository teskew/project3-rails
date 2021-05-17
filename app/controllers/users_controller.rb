class UsersController < ApplicationController
  before_action :redirect_if_not_logged_in, only: :show  

  def index
    @users = User.all
  end


  def new
     if !logged_in?
    @user = User.new
     else
      redirect_to root_path
     end
 end 

def create 
  user = User.new(user_params)
  if user.save 
    session[:user_id] = @user.id # log user in 
     redirect_to user_path(@user)
  else 
      render :new
  end 
end


  def show
    redirect_if_not_logged_in
     @user = User.find_by_id(params[:id])
    
     redirect_to '/' if !@user
  end
  

private

def user_params 
  params.require(:user).permit(:username,:email, :password)
end 
end



