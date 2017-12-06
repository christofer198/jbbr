class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create, :destroy]

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:message] = "Welcome #{user.name}"
      redirect_to profile_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path # need to create a signin page
  end

end
