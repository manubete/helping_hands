class OrganizationsController < ApplicationController
   def new
    @organization = Organization.new
    render :new
  end

   def create
    p "#{params.inspect}"
    @organization = Organization.new(params["organization"])
    @organization.save
    redirect_to root_path
  end

end