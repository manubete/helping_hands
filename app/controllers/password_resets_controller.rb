class PasswordResetsController < ApplicationController
  def new
  end

  def create
    donor = Donor.find_by_email(params[:email])
    donor.send_password_reset if donor
    if donor
      redirect_to root_url, :notice => "Email sent with password reset instructions"
    else
      redirect_to root_url, :notice => "Email not found"
    end
  end

  def edit
    @donor = Donor.find_by_password_reset_token!(params[:id])
  end

  def update
    @donor = Donor.find_by_password_reset_token!(params[:id])
    if @donor.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Password reset has expired."
    elsif @donor.update_attributes(params[:donor])
      redirect_to root_url, :notice => "Password has been reset!"
    else
      render :edit
    end

  end
end
