class SessionsController < ApplicationController
  
  def destroy #logout
    if !session[:user_id].nil? #cancelled a
        session.delete :user_id 
        @current_user = nil# CNCLED IN aysan
    else
       #redirect_to '/login'
        #session.delete(:user_id)
       redirect_to login_path #Aysan
   end
 end
  
  def new #render the login form  
   if logged_in?
    # redirect_to user_path(current_user)
    redirect_to root_path
   end
 end

     def create # processing the login form
        user = User.find_by(username: params[:user][:username])
       
          if user && user.authenticate(params[:user][:password]) 
          session[:user_id] = user.id
          redirect_to user_path(user) 
          #redirect_to root_path aysan
             else 
          flash[:message] = "Incorrect login info "
         redirect_to '/login'
         # render :new  aysan
            end 
    end

    

    def omniauth 
    
      user = User.find_or_create_by(uid: request.env['omniauth.auth'][:uid], provider: request.env['omniauth.auth'][:provider]) do |u|
        u.username = request.env['omniauth.auth'][:info][:first_name]
        u.email = request.env['omniauth.auth'][:info][:email]
       
        u.password = SecureRandom.hex(16)
      end 
      if user.valid?
        session[:user_id] = user.id # log them 
        redirect_to root_path
      else
        flash[:message]  = user.errors.full_messages.join(", ")
        redirect_to login_path 
      end 
 end
end
 
    