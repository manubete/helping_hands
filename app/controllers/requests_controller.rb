class RequestsController < ApplicationController
  def index
    render :index
  end

  def new
    @request = Request.new
    render :new
  end

  def create
    p "#{params["Request"]["organization"]}"
    @request = Request.new(organization: params["Request"]["organization"], resource: params["Request"]["resource"], address: params["Request"]["address"], description: params["Request"]["description"], disaster: params["Request"]["disaster"])
    @request.save
    redirect_to root_path
  end

  # def show
  #   @requests = Request.all
  #   render :show
  # end
end