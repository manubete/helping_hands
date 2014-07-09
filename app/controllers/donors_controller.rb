class DonorsController < ApplicationController
  def new
    @donor = Donor.new
    render :new
  end

  def create
    p "#{params.inspect}"
    @donor = Donor.new(params["donor"])
    @donor.save
    redirect_to root_path
  end

end

