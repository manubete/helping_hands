class ContributionsController < ApplicationController

    def create
    p "#{params["contribution"]}"
    @contribution = Contribution.new(params["contribution"])


    if @contribution.save
      flash[:notice] = "You have successfully created the contribution!"
      @request = Request.find(@contribution.request_id)

      @request.update_count(@contribution.resource_amount)

      #send an email
        @donor = Donor.find(@contribution.donor_id)
        @organization = Organization.find(@request.organization_id)

        @email_hash = { donor: @donor, organization: @organization, contribution: @contribution, request: @request

        }

        OrganizationMailer.notify_contribution(@email_hash).deliver

        DonorMailer.donor_contribution_notification(@email_hash).deliver

      redirect_to requests_path
    else
      flash[:notice] = "Incorrect signup information for the contribution"

       flash[:resource_amount] = @contribution.errors[:resource_amount] unless @contribution.errors[:resource_amount].empty?

      redirect_to request_path(@contribution.request_id)
    end

  end

end