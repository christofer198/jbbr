class CompaniesController < ApplicationController

  skip_before_action :authorized

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.valid?
      @company.save
      @user = User.find(session[:user_id])
      @user.update(company_id: @company.id)
      redirect_to profile_path(@user)
    else
      render :new
    end
  end

  def show
    @company = Company.find(params[:id])
    @openings = @company.openings
    #@users = @openings.map{|x| x.applications.where(company_likes: true).ids}.flatten.map{|x| Application.find(x).user}
    #byebug
  end

  private

  def company_params
    params.require(:company).permit(:name, :sector_id)
  end

end
