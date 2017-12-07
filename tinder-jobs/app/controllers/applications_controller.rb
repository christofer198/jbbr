require 'json'
require 'rest-client'
require 'i18n'
require 'nokogiri'
require 'open-uri'

class ApplicationsController < ApplicationController

  def index
    user = User.find(session[:user_id])
    openings = Opening.where(company_id: user.company_id)
    opening = openings.sample
    applications = opening.applications.where(opening_id: opening.id, user_like: true, employer_likes: nil)
    @application = applications.sample
    if @application.nil? == false
      @applicant = User.find(application.applicant_id).resume
    end
  end

  def update
    @application = Application.find(params[:id])
    @application.update(employer_likes: params[:like])
    redirect_to application_path(@application.opening_id)
  end

  def create
    #byebug
    if params[:commit] == "Apply"
      userlike = true
    else
      userlike = false
    end
    Application.create(opening_id: params[:opening_id].to_i, applicant_id: session[:user_id], user_like: userlike)
    redirect_to openings_path
  end

end
