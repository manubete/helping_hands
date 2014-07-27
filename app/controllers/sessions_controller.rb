class SessionsController < ApplicationController
  def disable_intro
    @disable_intro = true
  end

  def create

     @donor = Donor.find_by_email(params[:email])

     @organization = Organization.find_by_email(params[:email])


     if @donor && @donor.authenticate(params[:password])
      session[:donor_id] = @donor.id
      flash[:notice]="successful login!!"
        redirect_to requests_path

      elsif @organization && @organization.authenticate(params[:password])
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

 def find_security_question
  render :find_security_question
 end

 def security_question
  @donor = Donor.find_by_email(params[:email])
  @organization = Organization.find_by_email(params[:email])

  if @donor || @organization
    render :security_question
  else
    render :find_security_question
  end

 end

 def verify_security_question
  @donor = Donor.find(params[:donor_id]) if params[:donor_id]
   @organization = Organization.find(params[:organization_id]) if params[:organization_id]

  if @donor && params[:security_answer] == @donor.security_answer
      session[:donor_id] = @donor.id
    redirect_to edit_donor_path(params[:donor_id])
  elsif @organization && params[:security_answer] == @organization.security_answer
      session[:organization_id] = @organization.id
    redirect_to edit_organization_path(params[:organization_id])
  else
    redirect_to root_path
  end
 end


end
