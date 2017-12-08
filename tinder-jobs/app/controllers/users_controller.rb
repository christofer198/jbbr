class UsersController < ApplicationController

  skip_before_action :authorized, only: [:new, :create]
  skip_before_action :session_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params(:name, :email, :password, :password_confirmation, company: nil))
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      session[:type] = 1 # 1:applicant, -1: company
      redirect_to profile_path
    else
      render :new
    end
  end

  def openings
    @openings = Opening.all
  end

  def edit
    if params[:user]
      @user.update(user_params(:name, :email, :password, :password_confirmation, :pref_sector_id, :pref_distance, :zip_code))
    end
    if @user.resume
      @user.resume.update(resume_params)
    else
      @user.resume = Resume.create(resume_params)
    end
    flash[:message] = "Preferences Updated"
    redirect_to profile_path
  end

  def show
    @user = User.find(session[:user_id])
    @resume = @user.resume
    applications = Application.where(applicant_id: @user.id, employer_likes: true, user_like: true)
    @matches = applications.map{|x| Opening.find(x.opening_id)}
  end

  def matches
  end

  private

  def user_params(*args)
    params.require(:user).permit(args)
  end

  def resume_params
    params.require(:resume).permit(:title, :description)
  end

  #:name, :email, :password, :password_confirmation, :pref_sector_id, :pref_distance, :zip_code

end
