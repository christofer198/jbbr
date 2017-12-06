class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authorized

  def logged_in?
    !!session[:user]
  end

  def authorized
    if logged_in?
      redirect_to profile_path
    else
      redirect_to login_path
    end
  end

end
