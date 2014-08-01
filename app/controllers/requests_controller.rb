class RequestsController < ApplicationController
  helper_method :sort_column,:sort_direction

  def index
    p "#{@requests.inspect}"
    p  "#{@organizations.inspect}"
      if params[:search]
        @requests = Request.search(params[:search])
        @organizations = Organization.all
        p "#{@requests.inspect}"
        p  "#{@organizations.inspect}"
      elsif params[:tag]
        @requests = Request.tagged_with(params[:tag])
        @organizations = Organization.all
        p "#{@requests}"
        p  "#{@organizations.inspect}"
      else
        @requests = Request.order("#{sort_column} #{sort_direction}")
        @organizations = Organization.all
        p "#{@requests.inspect}"
        p  "#{@organizations.inspect}"
      end
      render :index
  end

  def donor_index
    #returns the list of donors that contributed to a particular request
    # p "#{params.inspect}"
    @request = Request.find(params["request"]["id"])
    @contributions = @request.contributions

    @donors = []

    @contributions.each do |contribution|
      @donor = Donor.find(contribution.donor_id)
      @donors.push(@donor) if !(@donors.include? @donor)
    end

    render :donor_index
  end

  def new
    @request = Request.new
    @organization = Organization.find(session[:organization_id])
    render :new
  end

  def create
    # p "#{params["request"]["organization"]}"
    @request = Request.new(params["request"])


    if @request.save
      flash[:notice] = "You have successfully created the request!"
      redirect_to requests_path
    else
      #flash errors on user signup
      flash[:notice] = "Incorrect signup information for the request"
      flash[:resource] = @request.errors[:resource] unless @request.errors[:resource].empty?
      flash[:current_resource_count] = @request.errors[:current_resource_count] unless @request.errors[:current_resource_count].empty?
      flash[:target_resource_count] = @request.errors[:target_resource_count] unless @request.errors[:target_resource_count].empty?
      flash[:address] = @request.errors[:address] unless @request.errors[:address].empty?
      flash[:description] = @request.errors[:description] unless @request.errors[:description].empty?
      flash[:tag_list] = @request.errors[:tag_list] unless @request.errors[:tag_list].empty?

      @request = Request.new
      @organization = Organization.find(session[:organization_id])
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

  def destroy
    @request = Request.find(params[:id])
    if @request
      @request.destroy
      flash[:notice] = "Request was deleted"
      redirect_to organization_path(session[:organization_id])
    end
  end

  def api_request
    requests = Request.all

    respond_to do |format|
      format.json {render json: requests, status:200 }
    end
  end

  def landing_page
    render :landing_page
  end

  def show
    @request = Request.find( params["id"])
    @organization = Organization.find(@request.organization_id)
    @contribution = Contribution.new
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