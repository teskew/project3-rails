class UsersController < ApplicationController
  before_action :redirect_if_not_logged_in, only: :show  

  # def index
  #   @users = User.all
  # end


  def new #render sign up form
     if !logged_in?
    @user = User.new
     else
      redirect_to @users
     end
 end 

def create # processing sign up form
  @user = User.new(user_params)
  if @user.save #if it is valid 
    session[:user_id] = @user.id # log user in 
    # redirect_to user_path(@user)
     redirect_to @user
     #redirect_to root_path aysa
  else 
    #show error message 
      render :new
  end 
end


  def show
   
     @user = User.find_by_id(params[:id])
    
     redirect_to '/' if !@user
  end
  

private

def user_params 
  params.require(:user).permit(:username,:email, :password)
end 
end



