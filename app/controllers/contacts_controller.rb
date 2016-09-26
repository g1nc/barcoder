class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
  end

  def new
    @contact = current_user.contacts.build
  end

  def create
    @contact = current_user.contacts.build(contact_params)
    if @contact.save
      redirect_to edit_contact_path(@contact), notice: 'Contact was successfully created.'
    else
      render :new
    end
  end

  def edit
    if @contact.user_id != current_user.id
      respond_to json: {error: true, message: 'Current contact not belongs to you!' }
    end
  end

  def update
    if @contact.update(contact_params)
      redirect_to edit_contact_path(@contact), notice: 'Contact was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @contact.delete
    redirect_to contacts_url, notice: 'Contact was successfully destroyed.'
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:name, :phone, :token)
    end
end
