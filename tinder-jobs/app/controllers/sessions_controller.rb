class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create]
  skip_before_action :session_user

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:type] = 1
      flash[:message] = "Welcome #{user.name}"
      redirect_to profile_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

end
