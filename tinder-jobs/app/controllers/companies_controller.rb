class CompaniesController < ApplicationController

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.valid?
      @company.save
      @user.update(company_id: @company.id)
      redirect_to profile_path(@user)
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
    #@users = @openings.map{|x| x.applications.where(company_likes: true).ids}.flatten.map{|x| Application.find(x).user}
    #byebug
  end

  private

  def company_params
    params.require(:company).permit(:name, :sector_id)
  end

end
