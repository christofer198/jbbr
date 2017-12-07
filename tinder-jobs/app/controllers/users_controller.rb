class UsersController < ApplicationController

  skip_before_action :authorized, only: [:new, :create]
  skip_before_action :session_user, only: [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params(:name, :email, :password, :password_confirmation))
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to profile_path
    else
      render :new
    end
  end

  def openings
    @openings = Opening.all
  end

  def edit
    @user.update(user_params(:name, :email, :password, :password_confirmation, :pref_sector_id, :pref_distance, :zip_code))
    flash[:message] = "Preferences Updated"
    redirect_to profile_path
  end

  def show
    @user = User.find(session[:user_id])
    applications = Application.where(applicant_id: @user.id, employer_likes: true, user_like: true)
    @matches = applications.map{|x| Opening.find(x.opening_id)}
    #byebug
  end

  def add_resume
    @resume = Resume.new
  end

  private

  def user_params(*args)
    params.require(:user).permit(*args)
  end

  #:name, :email, :password, :password_confirmation, :pref_sector_id, :pref_distance, :zip_code

end
