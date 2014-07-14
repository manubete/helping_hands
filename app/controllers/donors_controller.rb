class DonorsController < ApplicationController
  def new
    @donor = Donor.new
    render :new
  end

  def create
    @donor = Donor.new(params["donor"])

    if @donor.save
      flash[:notice] = "You have successfully signed up!"
      session[:donor_id] = @donor.id
      redirect_to requests_path
    else
       flash[:notice] = "Incorrect signup information"
      render :new
    end
  end

  def show
    @donor = Donor.find(params[:id])
    @requests = @donor.requests.uniq
    @contributions = @donor.contributions
    render :show
  end

  def edit
    @donor = Donor.find(params[:id])
    render :edit
  end

  def update
    @donor = Donor.find(params[:id])

     # p "#{params.inspect}"

     if @donor.update_attributes(params[:donor])
      redirect_to(@donor)
    else
      render :edit
    end
  end

end

