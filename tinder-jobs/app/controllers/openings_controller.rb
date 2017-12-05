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
    @openings = Opening.all
  end

end
