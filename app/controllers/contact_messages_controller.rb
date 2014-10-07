class ContactMessagesController < ApplicationController
  def new
    @contact_message = ContactMessage.new
    render :new
  end

  def create
    @contact_message = ContactMessage.new(params[:contact_message])
    if @contact_message.save
      flash[:notice] = "Thank you for your message! We will contact you as soon as possible."
      redirect_to root_url
    end
  end
end
