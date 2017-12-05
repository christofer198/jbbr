class OpeningsController < ApplicationController
  def show
    @opening = Opening.find(params[:id])
  end

  def new
  end
end
