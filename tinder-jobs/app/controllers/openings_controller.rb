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
