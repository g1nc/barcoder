class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
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
    @contact.delete
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end
end
