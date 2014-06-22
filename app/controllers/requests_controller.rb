class RequestsController < ApplicationController
  def index
    @requests = Request.all
    render :index
  end

  def new
    @request = Request.new
    render :new
  end

  def create
    p "#{params["request"]["organization"]}"
    @request = Request.new(organization: params["request"]["organization"], resource: params["request"]["resource"],resource_count: params["request"]["resource_count"], address: params["request"]["address"], description: params["request"]["description"], purpose: params["request"]["purpose"])
    @request.save
    redirect_to root_path
  end

  def landing_page
    render :landing_page
  end

  def api_request
    requests = Request.all

    respond_to do |format|
      format.json {render json: requests, status:200 }
    end
  end

  def show
    @request = Request.find( params["id"])
    render :show
  end
end