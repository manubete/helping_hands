class OrganizationsController < ApplicationController
   def new
    @organization = Organization.new
    render :new
  end

   def create
    #p "#{params.inspect}"
    p session[:errors]
    @organization = Organization.new(params["organization"])

    if @organization.save
      flash[:notice] = "You have successfully signed up!"
      redirect_to requests_path
    else
      flash[:notice] = "Incorrect signup information"
      render :new
    end
  end

  def show
    @organization = Organization.find(params[:id])
    @requests = @organization.requests
    render :show
  end

  def edit
    @organization = Organization.find(params[:id])
    render :edit
  end

  def update
    @organization = Organization.find(params[:id])

     p "#{params.inspect}"

     if @organization.update_attributes(params[:organization])
      redirect_to(@organization)
    else
      render :edit
    end

  end

end