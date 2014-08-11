class ContactsController < ApplicationController
  def new
    @contact = Contacts.new
  end

  def create
    @contact = Contacts.new(params[:contacts])
    if @contact.save
      redirect_to requests_path
    end
  end

end
