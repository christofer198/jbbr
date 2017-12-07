class UsersController < ApplicationController

  skip_before_action :authorized, only: [:new, :create]
<<<<<<< HEAD
  skip_before_action :session_user, only: [:new, :create]
=======
>>>>>>> refs/remotes/origin/master

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
<<<<<<< HEAD
    @user = User.new(user_params(:name, :email, :password, :password_confirmation))
=======
    byebug
    @user = User.new(user_params)
>>>>>>> refs/remotes/origin/master
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
