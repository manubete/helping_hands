class OrganizationsController < ApplicationController
  def new
    @organization = Organization.new
    render :new
  end

  def create
    @organization = Organization.new(params["organization"])
    @organization.update_attributes(params[:organization])

    if @organization.save
      flash[:notice] = "You have successfully signed up!"
      session[:organization_id] = @organization.id
      redirect_to organization_path(@organization.id)
    else
      flash[:notice] = "Incorrect signup information"

      flash[:name] = @organization.errors[:name] unless @organization.errors[:name].empty?
      flash[:address] = @organization.errors[:address] unless @organization.errors[:address].empty?
      flash[:operation_days] = @organization.errors[:operation_days] unless @organization.errors[:operation_days].empty?
      flash[:opening_time] = @organization.errors[:opening_time] unless @organization.errors[:opening_time].empty?
      flash[:closing_time] = @organization.errors[:closing_time] unless @organization.errors[:closing_time].empty?
      flash[:phone_number] = @organization.errors[:phone_number] unless @organization.errors[:phone_number].empty?
      flash[:email] = @organization.errors[:email] unless @organization.errors[:email].empty?
      flash[:tax_id] = @organization.errors[:tax_id] unless @organization.errors[:tax_id].empty?
      flash[:website_url] = @organization.errors[:website_url] unless @organization.errors[:website_url].empty?
      flash[:description] = @organization.errors[:description] unless @organization.errors[:description].empty?
      flash[:password] = @organization.errors[:password] unless @organization.errors[:password].empty?

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

  def check_email
    organization = Organization.where('email = ?', params[:email]).count
    donor = Donor.where('email = ?', params[:email]).count
    if organization == 0 && donor == 0
      render :nothing => true, :status => 200
    else
      render :nothing => true, :status => 409
    end
    return
  end

end
