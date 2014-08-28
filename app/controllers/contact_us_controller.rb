class ContactUsController < ApplicationController
  def new
    @contactUs = ContactUs.new
  end

  def create
    @contactUs = ContactUs.new(params[:contactUs])
    if @contactUs.save
      redirect_to root_url
    end
  end
end
