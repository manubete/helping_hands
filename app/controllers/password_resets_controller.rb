class PasswordResetsController < ApplicationController
  def new
  end

  def create
    #find an organization or a donor by email
    donor = Donor.find_by_email(params[:email])
    organization = Organization.find_by_email(params[:email])

    #send a password reset to their email
    donor.send_password_reset if donor
    organization.send_password_reset if organization

    flash[:notice] = "Email sent with password reset instructions"
    redirect_to root_url
  end

  def edit
    begin
     #could not use find since error handling prevented the program from functioning, had to use where
    @donor = Donor.where(password_reset_token: params[:id]).first
    @organization = Organization.where(password_reset_token: params[:id]).first
      rescue ActiveRecord::RecordNotFound
        flash[:notice] = "Your records were not found on our database"
        redirect_to root_url
       return
      end
  end

  def update
    #could not use find since error handling prevented the program from functioning, had to use where
    @donor = Donor.where(password_reset_token: params[:id]).first
    @organization = Organization.where(password_reset_token: params[:id]).first

    #if there is a donor or an organization who was found and whose attributes were correctly changed, redirect to the root path
    if (@donor && @donor.update_attributes(params[:donor])) || (@organization && @organization.update_attributes(params[:organization]))
      flash[:notice] = "Password has been reset"
      redirect_to root_url
    else
      # Else, render the edit form again
      render :edit
    end
  end
end
