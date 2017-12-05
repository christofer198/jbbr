class EmployersController < ApplicationController

  def new
    @employer = Employer.new
  end

  def create
  end

  def show
    @employer = Employer.find(params[:id])
    @openings = @employer.openings
  end

  def index
  end

end
