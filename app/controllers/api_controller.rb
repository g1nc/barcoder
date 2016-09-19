class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user
  respond_to :json

  def contact
    @contact = Contact.new
    @contact.user = @user
    @contact.name = params[:name]
    @contact.phone = params[:phone]
    @contact.token = params[:token]

    if @contact.save
      render json: { success: true, contact: @contact }
    else
      render json: { success: false, errors: @contact.errors, status: :unprocessable_entity }
    end
  end

  def topics
    render json: { success: true, topics: @user.topics}
  end

  def events
    render json: { success: true, topics: @user.events}
  end

  private
    def set_user
      @user = User.find_by_token(params[:app])
      if @user.empty?
        render json: { success: false, errors: 'Invalid token.'}
      end
    end
end
