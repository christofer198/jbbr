class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authorized
  before_action :session_user

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
    @user = User.find(session[:user_id])
  end

  def company_matches
    @applications = Application.where(employer_likes: true, user_like: true)
    @employer_filter = @applications.select{|application| application.opening.company_id == session_user.company_id}
  end

  def user_matches
    @applications = Application.where(employer_likes: true, user_like: true, applicant_id: session_user.id)
  end

end
