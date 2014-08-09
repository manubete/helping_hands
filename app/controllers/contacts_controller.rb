class ContactsController < ApplicationController
  def new
    @contacts = Contacts.new
  end

  def create
    @contacts = Contacts.new(params[:contacts])
    if @contacts.save
      redirect_to requests_path
    end
  end

end
