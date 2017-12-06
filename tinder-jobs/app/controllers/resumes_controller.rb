class ResumesController < ApplicationController

  skip_before_action :authorized, only: [:new, :show, :create, :destroy]

  def new
    @resume = Resume.new
    @applicant_id = session[:user_id]
  end

  def create
    @resume = Resume.new(resume_params)
    if @resume.save
      flash[:message] = "Resume saved!"
      redirect_to profile_path
    else
      render :new
    end
  end

  def edit
    @resume = Resume.find(params[:id])
  end

  def update
    @resume = Resume.find(params[:id])
    user = @resume.user
    @resume.update(resume_params)
    redirect_to profile_path
  end

  def show
    @resume = User.find(session[:user_id]).resume
  end

  def index
    @resumes = Resume.all
  end

  def resume_params
    params.require(:resume).permit(:title, :description, :applicant_id)
  end

end
