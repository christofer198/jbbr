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

    # @sector = "sector_id = #{params[:sector][:sector_id]}" ||= ""
    # @company = "company_id = #{params[:company][:company_id]}" ||= ""

    # byebug
    if !params[:sector].nil? && !params[:sector][:sector_id].empty?
      @sector = "sector_id = #{params[:sector][:sector_id]}"
    else
      @sector = ""
    end

    if !params[:company].nil? && !params[:company][:company_id].empty?
      @company = "company_id = #{params[:company][:company_id]}"
    else
      @company = ""
    end

    Sector.where(@sector)
    Company.where(@company)

      openings.where(company_id: params[:company][:company_id])

    else
      @openings = Opening.all
    end
  end

end
