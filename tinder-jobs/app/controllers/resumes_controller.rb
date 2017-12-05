class ResumesController < ApplicationController

  def new
    @resume = Resume.new
    # @user =
  end

  def create
    # byebug
    @resume = Resume.new(title: params[:title], description: params[:description])
    if @resume.valid?
      @resume.save
      redirect_to resume_path(@resume)
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
    @resume.update(title: params[:title], description: params[:description])
    redirect_to user_path(user)
  end

  def show
  end

  def index
    @resumes = Resume.all
  end

end
