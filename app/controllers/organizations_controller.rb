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

end