class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def openings
    @openings = Opening.all
  end

  def show
    @user = User.find(params[:id])
  end

  def add_resume
    @resume = Resume.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
