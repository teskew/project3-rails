class UsersController < ApplicationController
  before_action :redirect_if_not_logged_in, only: :show  
def new 
      @user = User.new
  
 end 

def create 
  @user = User.new(user_params)
  if @user.save 
    session[:user_id] = @user.id # log user in 
     redirect_to @user

  else 
      
      render :new
    
  end 
end

# def show
#   @user = current_user
#   @books = current_user.borrowed_books.currently_checked_out_books.select {|book| current_borrower(book) == current_user }
#   @reviews = current_user.reviews
#   user_from_url_submitted_id = User.find_by(id: params[:id])
#   redirect_if_not_authorized_to_view(user_from_url_submitted_id)
# end

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



