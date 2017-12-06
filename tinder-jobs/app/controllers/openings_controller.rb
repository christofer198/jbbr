class OpeningsController < ApplicationController

  def new
    @opening = Opening.new
  end

  def create
    #byebug
    @opening = Opening.create(opening_params)
    user = User.find(session[:user_id]).company_id
    @opening.update(company_id: user)
    redirect_to company_path(user)
    #else
      #render :new
    #end
  end

  def edit
    @user = User.find(session[:user_id])
    @opening = Opening.find(params[:id])
    if @user.company_id == @opening.company_id
      @opening = Opening.find(params[:id])
    else
      profile_path
    end
  end

  def update
    @opening = Opening.update(params[:id], opening_params)
    redirect_to opening_path(@opening)
  end

  def destroy
    Opening.destroy(params[:id])
    user = User.find(session[:user_id]).company_id
    redirect_to company_path(user)
  end

  def show
    @user = User.find(session[:user_id])
    @opening = Opening.find(params[:id])
    if @user.company_id == @opening.company_id
     @opening = Opening.find(params[:id])
   else
     redirect_to profile_path
   end
  end

  def index
    # @sector = "sector_id = #{params[:sector][:sector_id]}" ||= ""
    # @company = "company_id = #{params[:company][:company_id]}" ||= ""

    # byebug
    # if !params[:sector].nil? && !params[:sector][:sector_id].empty?
    #   @sector = "sector_id = #{params[:sector][:sector_id]}"
    # else
    #   @sector = ""
    # end
    @openings = Opening.all
    # if !params[:company].nil? && !params[:company][:company_id].empty?
    #   @company = "company_id = #{params[:company][:company_id]}"
    # else
    #   @company = ""
    # end
    #
    # Sector.where(@sector)
    # Company.where(@company)
    #
    #   openings.where(company_id: params[:company][:company_id])
    #
    # else
    #   @openings = Opening.all
    # end
  end

 private

 def opening_params
    params.require(:opening).permit(:title, :description, :salary)
  end
end
