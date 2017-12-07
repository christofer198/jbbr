require 'json'
require 'rest-client'
require 'i18n'
require 'nokogiri'
require 'open-uri'

class ApplicationsController < ApplicationController

  def show
    #byebug
    @user = User.find(session[:user_id])
    @opening = Opening.find(params[:id])
    if @user.company_id == @opening.company_id
      @applications = Application.where(["opening_id = ? and employer_likes IS NULL", params[:id]])
      if @opening.max_distance != nil
        max_dist = @opening.max_distance
        opening_zip = @opening.zip_code
        source = RestClient.get("http://api.zip-codes.com/ZipCodesAPI.svc/1.0/FindZipCodesInRadius?zipcode=#{opening_zip}&minimumradius=0&maximumradius=#{max_dist}&key=U9SA94E98NNA62YT854K")
        zip_hash = {}
        eval(source)[:DataList].collect{|x| zip_hash[x[:Code].to_i] = x[:Distance]}
        @applications = @applications.select{|application| zip_hash.keys.include?(application.applicant.zip_code)}.sort_by{|application| zip_hash[application.applicant.zip_code]}
      end
      #byebug
    else
      redirect_to profile_path
    end

    #byebug
  end

  def update
    @application = Application.find(params[:id])
    @application.update(employer_likes: params[:like])
    redirect_to application_path(@application.opening_id)
  end

  def create
    #byebug
    Application.create(opening_id: params[:opening_id].to_i, applicant_id: session[:user_id], user_like: true)
    redirect_to openings_path
  end

end
