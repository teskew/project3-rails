class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
   def home
    if !logged_in?
       redirect_to login_path
    end
    end

private
  def current_user # memoization
    @current_user ||= User.find_by_id(id: session[:user_id])
    end 

   def logged_in?
     #!!session[:user_id]
     current_user
    end 

   def redirect_if_not_logged_in
    redirect_to '/' if !logged_in?
    end
    
end