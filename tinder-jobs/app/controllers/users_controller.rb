class UsersController < ApplicationController

  skip_before_action :authorized, only: [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    byebug
    @user = User.new(user_params)
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

  def show
    @user = User.find(session[:user_id])
  end

  def add_resume
    @resume = Resume.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
