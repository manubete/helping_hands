class SessionsController < ApplicationController
  def disable_intro
    @disable_intro = true
  end

  def create

     @donor = Donor.find_by_email(params[:email])

     @organization = Organization.find_by_email(params[:email])


     if @donor && @donor.authenticate(params[:password])
      session[:donor_id] = @donor.id
      flash[:notice]="Successfully logged in."
        redirect_to requests_path

      elsif @organization && @organization.authenticate(params[:password])
        session[:organization_id] = @organization.id
        flash[:notice]="Successfully logged in."
        redirect_to requests_path
      else
        flash[:notice]="Unsuccessful login"
        redirect_to user_type_login_confirmation_sessions_path
     end
  end

def destroy
  session.clear
  flash[:notice]= "Logged out"
  redirect_to root_path
end

 def user_type_confirmation
  render :user_type_confirmation
 end

 def user_type_login_confirmation
  render :user_type_login_confirmation
 end


end
