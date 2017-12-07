class WelcomeController < ApplicationController
  skip_before_action :authorized, :session_user

  def index
    render :layout => false
  end
end
