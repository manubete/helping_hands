class RequestsController < ApplicationController
  helper_method :sort_column,:sort_direction

  def index
      if params[:search]
        @requests = Request.search(params[:search])
      else
        @requests = Request.order("#{sort_column} #{sort_direction}")
      end

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

  def user_type_confirmation
    render :user_type_confirmation
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

  private

  def sort_column
    Request.column_names.include?(params[:sort])? params[:sort] : "organization"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end