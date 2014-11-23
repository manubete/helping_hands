class DonorsController < ApplicationController
  def new
    @donor = Donor.new
    render :new
  end

  def create
    @donor = Donor.new(params["donor"])

    if @donor.save
      #DonorMailer.registration_confirmation(@donor).deliver

      #@donor.verified == false

      #flash[:notice] = "Please check your email"
      flash[:notice] = "Thanks for signing up!"
      session[:donor_id] = @donor.id
      redirect_to requests_path
    else
      flash[:notice] = "Incorrect signup information"

      flash[:name] = @donor.errors[:name] unless @donor.errors[:name].empty?
      flash[:address] = @donor.errors[:address] unless @donor.errors[:address].empty?
      flash[:phone_number] = @donor.errors[:phone_number] unless @donor.errors[:phone_number].empty?
      flash[:email] = @donor.errors[:email] unless @donor.errors[:email].empty?
      flash[:password] = @donor.errors[:password] unless @donor.errors[:password].empty?

      render :new
    end
  end

  def verified
    @donor.verified == true
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
