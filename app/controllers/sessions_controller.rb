class SessionsController < ApplicationController

  def new
  end

  def create
    if user = User.authenticate_user(params[:username], params[:password])
      # Save user as cookie when login successful
      session[:user_id] = user.id
      # redirect_to '/'
    else
      # redirect_to '/login'
      # assuming there is a login form at this route
    end
  end

  def destroy
    session[:user_id] = nil
    # redirect to '/login'
  end
end
