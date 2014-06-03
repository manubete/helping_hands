class RequestsController < ApplicationController
  def index
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

  def list
    @requests = Request.all
    render :list
  end

  def show
    @request = Request.find( params["id"])
    render :show
  end
end