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
    @organization = Organization.find(session[:organization_id])
    render :new
  end

  def create
    p "#{params["request"]["organization"]}"
    @request = Request.new(params["request"])


    if @request.save
      flash[:notice] = "You have successfully created the request!"
      redirect_to requests_path
    else
      flash[:notice] = "Incorrect signup information for the request"
      render :new
    end

  end

  def edit
    @request = Request.find(params[:id])
    render :edit
  end

  def update
    @request = Request.find(params[:id])
     if @request.update_attributes(params[:request])
      redirect_to(@request)
    else
      render :edit
    end
  end

  def api_request
    requests = Request.all

    respond_to do |format|
      format.json {render json: requests, status:200 }
    end
  end

  def show
    @request = Request.find( params["id"])
    @organization = Organization.find(@request.organization_id)
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