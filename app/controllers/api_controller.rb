class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :json

  def contact
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
