class PasswordResetsController < ApplicationController

  def new
  end

  def create
    donor = Donor.find_by_email(params[:email])
    organization = Organization.find_by_email(params[:email])

    donor.send_password_reset if donor
    organization.send_password_reset if organization

    if donor || organization
      redirect_to root_url, :notice => "Email sent with password reset instructions."
    else
      flash[:error] = "Email not found. Are you registered with Ripple in a Pond?"
      render :new
    end
  end

  def edit
    @donor = Donor.where(password_reset_token: params[:id]).first
     @organization = Organization.where(password_reset_token: params[:id]).first
  end

  def update
     @donor = Donor.where(password_reset_token: params[:id]).first
     @organization = Organization.where(password_reset_token: params[:id]).first

    if (@donor && @donor.update_attributes(params[:donor])) || (@organization && @organization.update_attributes(params[:organization]))
      redirect_to root_url, :notice => "Password has been reset!"
    else
      render :edit
    end
  end

end
