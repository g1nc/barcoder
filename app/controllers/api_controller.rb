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
    render json: { success: true, events: @user.events}
  end

  def subscribe
    @contact = Contact.find(params[:contact])
    @topic = Topic.find(params[:topic])
    if @contact.topics.find(@topic).nil?
      @contact.topics << @topic
      render json: { success: true, events: @user.events}
    else
      render json: { success: false, errors: 'Already subscribed.'}
    end
  end

  def unsubscribe
    @contact = Contact.find(params[:contact])
    @topic = @contact.topics.find(params[:topic])

    if @topic.nil?
      render json: { success: false, errors: "Contact isn't subscribed for this topic."}
    else
      @contact.topics.delete(@topic)
      render json: { success: true }
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
