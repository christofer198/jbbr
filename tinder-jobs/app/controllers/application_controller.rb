class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authorized

  def logged_in?
    !!session[:user_id]
  end

  def authorized
    if logged_in?
    else
      redirect_to login_path
    end
  end

  def session_user
    User.find(session[:user_id])
  end

end
