class ContactsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    @contact = Contact.find(params[:id])
    if @contact.user_id != current_user.id
      respond_to json: {error: true, message: 'Current contact not belongs to you!' }
    end
  end

  def new
  end

  def create
  end

  def edit
    @contact = Contact.find(params[:id])
    if @contact.user_id != current_user.id
      respond_to json: {error: true, message: 'Current contact not belongs to you!' }
    end
  end

  def update
  end

  def destroy
  end
end
