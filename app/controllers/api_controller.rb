class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user
  respond_to :json

  def contact
    @contact = @user.contacts.build
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
    render json: { success: true, events: @user.events}
  end

  def subscribe
    @contact = Contact.find_by_code(params[:contact])
    @topic = Topic.find(params[:topic])
    
    if @contact.topics.where(id: params[:topic]).count == 0
      @contact.topics << @topic
      render json: { success: true, message: 'Succefully subscribed'}
    else
      @contact.topics.delete(@topic)
      render json: { success: true, message: 'Succefully unsubscribed'}
    end
  end

  private
    def set_user
      @user = User.find_by_token(params[:app])
      if @user.nil?
        render json: { success: false, errors: 'Invalid token.'}
      end
    end
end
