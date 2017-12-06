class CompaniesController < ApplicationController

  def new
    @company = Company.new
  end

  def create
    @company = Company.create(company_params)
  end

  def show
    @company = Company.find(params[:id])
    @openings = @company.openings
    @users = @openings.map{|x| x.applications.where(company_likes: true).ids}.flatten.map{|x| Application.find(x).user}
    #byebug
  end

  private

  def company_params
    params.require(:company).permit(:name, :sector_id)
  end

end
