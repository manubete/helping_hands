class OrganizationsController < ApplicationController
   def new
    @organization = Organization.new
    render :new
  end

   def create
    @organization = Organization.new(params["organization"])

    if @organization.save
      flash[:notice] = "You have successfully signed up!"
      session[:organization_id] = @organization.id
      redirect_to organization_path(@organization.id)
    else
      flash[:notice] = "Incorrect signup information"

      flash[:name] = @organization.errors[:name] unless @organization.errors[:name].empty?
     flash[:city] = @organization.errors[:city] unless @organization.errors[:city].empty?
    flash[:address] = @organization.errors[:address] unless @organization.errors[:address].empty?
    flash[:operation_days] = @organization.errors[:operation_days] unless @organization.errors[:operation_days].empty?
    flash[:operation_hours] = @organization.errors[:operation_hours] unless @organization.errors[:operation_hours].empty?
    flash[:phone_number] = @organization.errors[:phone_number] unless @organization.errors[:phone_number].empty?
    flash[:email] = @organization.errors[:email] unless @organization.errors[:email].empty?
    flash[:website_url] = @organization.errors[:website_url] unless @organization.errors[:website_url].empty?
    flash[:username] = @organization.errors[:username] unless @organization.errors[:username].empty?
     flash[:password] = @organization.errors[:password] unless @organization.errors[:password].empty?


      @organization = Organization.new
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
     if @organization.update_attributes(params[:organization])
      redirect_to(@organization)
    else
      render :edit
    end
  end
end