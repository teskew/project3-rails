class UsersController < ApplicationController
  before_action :redirect_if_not_logged_in, only: :show  

  def index
    @users = User.all
  end


  def new 
      @user = User.new
 end 

def create 
  
  @user = User.new(user_params)
  if @user.save 
    session[:user_id] = @user.id # log user in 
     redirect_to  @user# @user_path #

  else 
      render :new
  end 
end


  # def show
  #   redirect_if_not_logged_in
  #    @user = User.find_by_id(params[:id])
    
  #    redirect_to '/' if !@user
  # end
  

private

def user_params 
  params.require(:user).permit(:username,:email, :password)
end 
end



