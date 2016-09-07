class ContactsController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :json

  def index
    @user = User.find_by_application_token(params[:token])
    if @user
      respond_with success: true, contacts: @user.contacts
    else
      respond_with success: false, message: 'Invalid token'
    end
  end

  def create
    @user = User.find_by_application_token(params[:application])

    @contact = Contact.new
    @contact.user = @user
    @contact.name = params[:name]
    @contact.phone = params[:phone]
    @contact.token = params[:device]

    if @contact.save
      render json: { success: true, contact: @contact }
    else
      render json: { success: false, errors: @contact.errors, status: :unprocessable_entity }
    end
  end

end
