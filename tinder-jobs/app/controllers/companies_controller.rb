class CompaniesController < ApplicationController

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.valid?
      @company.save
      @user.update(company_id: @company.id)
      redirect_to profile_path
    else
      render :new
    end
  end

  def show
    @user = User.find(session[:user_id])
    if @user.company_id == params[:id].to_i
      @company = Company.find(params[:id])
      @openings = @company.openings
    else
      redirect_to profile_path
    end
    @users = @openings.map{|x| x.applications.where(employer_likes: true, user_like: true).ids}.flatten.map{|x| User.find(Application.find(x).applicant_id)}
  end

  private

  def company_params
    params.require(:company).permit(:name, :sector_id)
  end

end
