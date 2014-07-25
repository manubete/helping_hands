class ContributionsController < ApplicationController

    def create
    p "#{params["contribution"]}"
    @contribution = Contribution.new(params["contribution"])
    @contribution.update_attributes(params[:contribution])


    if @contribution.save
      flash[:notice] = "You have successfully created the contribution!"
      @request = Request.find(@contribution.request_id)

      @request.update_count(@contribution.resource_amount)

      #send an email
        @donor = Donor.find(@contribution.donor_id)

         #sent it

      redirect_to requests_path
    else
      flash[:notice] = "Incorrect signup information for the contribution"

       flash[:resource_amount] = @contribution.errors[:resource_amount] unless @contribution.errors[:resource_amount].empty?

      redirect_to request_path(@contribution.request_id)
    end

  end

end
