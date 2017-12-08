class OpeningsController < ApplicationController

  def new
    @opening = Opening.new
  end

  def create
    @opening = Opening.create(opening_params)
    user = User.find(session[:user_id]).company_id
    @opening.update(company_id: user)
    redirect_to company_path(user)
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
      openings = Sector.find(params[:sector][:sector_id]).openings
    else
      openings = Opening.all
    end
    user = User.find(session[:user_id])
    @openings = openings.reject{|x| Application.where(opening_id: x, applicant_id: user.id).blank? == false}
    params[:distance] = nil if params[:distance] == ""
    #byebug
    if user.pref_distance.nil? == false || params[:distance].nil? == false
      max_dist = params[:distance].nil? ? user.pref_distance : params[:distance].to_i
      user_zip = user.zip_code
      source = RestClient.get("http://api.zip-codes.com/ZipCodesAPI.svc/1.0/FindZipCodesInRadius?zipcode=#{user_zip}&minimumradius=0&maximumradius=#{max_dist}&key=U9SA94E98NNA62YT854K")

      @zip_hash = {}
      eval(source)[:DataList].collect{|zips| @zip_hash[zips[:Code].to_i] = zips[:Distance]}
      @openings = @openings.reject{|opening| @zip_hash.keys.include?(opening.zip_code) == false}
    end
  end

  def opening_params
    params.require(:opening).permit(:title, :description, :salary, :zip_code, :company_id)
  end

end
