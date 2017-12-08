class ResumesController < ApplicationController

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
    @resume = session_user.resume
  end

  def update # not useful anymore??????? see users#edit
    #byebug
    @resume = Resume.find_or_create_by(applicant_id: @user.id)
    @resume.update(resume_params)
    redirect_to profile_path
  end

  def resume_params
    params.require(:resume).permit(:title, :description, :applicant_id)
  end

end
