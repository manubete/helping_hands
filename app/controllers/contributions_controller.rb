class ContributionsController < ApplicationController

    def create
    p "#{params["contribution"]}"
    @contribution = Contribution.new(params["contribution"])


    if @contribution.save
      flash[:notice] = "You have successfully created the contribution!"
        #make this into a class method, that way it makes it complete if its 0
      @request = Request.find(@contribution.request_id)

      @request.update_count(@contribution.resource_amount)

      redirect_to requests_path
    else
      flash[:notice] = "Incorrect signup information for the contribution"
      render :new
    end

  end

end