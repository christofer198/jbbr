class OpeningsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :destroy]

  def new
    @opening = Opening.new
  end

  def create
    @opening = Opening.create(opening_params)
    user = User.find(session[:user_id]).company_id
    @opening.update(company_id: user)
    redirect_to company_path(@opening.company_id)
  end

  def show
    @opening = Opening.find(params[:id])
  end

  def index
    @openings = Opening.all
  end

  private

  def opening_params
    params.require(:opening).permit(:title, :description, :salary)
  end

end
