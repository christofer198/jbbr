class EmployersController < ApplicationController

  def new
    @employer = Employer.new
  end

  def create
    @employer = Employer.create(employer_params)
  end

  def show
    @employer = Employer.find(params[:id])
    @openings = @employer.openings
    @users = @openings.map{|x| x.applications.where(employer_likes: true).ids}.flatten.map{|x| Application.find(x).user}
    #byebug
  end

  private

  def employer_params
    params.require(:employer).permit(:name, :sector_id)
  end

end
