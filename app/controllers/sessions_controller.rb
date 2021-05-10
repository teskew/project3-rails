class SessionsController < ApplicationController
  #
  def new
   if logged_in?
     redirect_to user_path(current_user)
   end
 end

 def omniauth
   user = User.create_from_omniauth(auth)

   if user.valid?
     session[:user_id] = user.id
     redirect_to user_path(user.id)
   else
     flash[:message] = "#{user.errors.full_messages.join("")}."
     redirect_to login_path
   end
 end
  #
  

     def create # processing the login form
        user = User.find_by(username: params[:user][:username])
       
          if user && user.authenticate(params[:user][:password]) 
          session[:user_id] = user.id
          redirect_to user_path(user) 
             else 
          flash[:error] = "Incorrect login info "
         redirect_to login_path
            end 
    end

    def destroy #logout
   #    redirect_if_not_logged_in
   #    session.clear 
   #  redirect_to root_path
   session.delete(:user_id)
   redirect_to '/login'
end

def auth
request.env['omniauth.auth']
end


      
    end
 
    