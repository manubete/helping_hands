class SessionsController < ApplicationController
  def new_donor
    render :new_donor
  end

  def new_organization
    render :new_organization
  end

  def create
     #p "#{params.inspect} #{params["password"]}"
     @donor = Donor.authenticate(params[:email], params[:password])

     @organization = Organization.authenticate(params[:email], params[:password])

     if @donor
      session[:donor_id] = @donor.id
      flash[:notice]="successful login!!"
        redirect_to requests_path

      elsif @organization
        session[:organization_id] = @organization.id
        flash[:notice]="successful login!!"
        redirect_to requests_path
      else
        flash[:notice]=" Unsuccessful login"
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