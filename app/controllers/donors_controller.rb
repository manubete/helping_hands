class DonorsController < ApplicationController
  def new
    @donor = Donor.new
    render :new
  end

  def create
    @donor = Donor.new(params["donor"])

    if @donor.save
      flash[:notice] = "You have successfully signed up!"
      redirect_to requests_path
    else
       flash[:notice] = "Incorrect signup information"
      render :new
    end
  end

end

