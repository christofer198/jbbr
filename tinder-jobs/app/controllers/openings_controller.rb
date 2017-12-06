class OpeningsController < ApplicationController



  def new
    @opening = Opening.new
  end

  def create
    @opening = Opening.new
    if @opening.valid?
      @opening.save
      redirect_to opening_path(@opening)
    else
      render :new
    end
  end

  def show
  end

  def index
    if !params[:sector].nil? && !params[:sector][:sector_id].empty?
      @openings = Sector.find(params[:sector][:sector_id]).openings
    else
      @openings = Opening.all
    end
  end

  def opening_params
    params.require(:opening).permit(:title, :description, :salary, :zip_code, :company_id)
  end


end
