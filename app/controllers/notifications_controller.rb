class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @notifications = Notification.all
  end

  def new
    @notification = Notification.new
  end

  def create
    @notification = Notification.new(notification_params)
    @notification.user = current_user
    if @notification.save
      redirect_to @notification, notice: 'Notification was successfully created.'
    else
      render :new
    end
  end

  def update
    if @notification.update(notification_params)
      redirect_to @notification, notice: 'Notification was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @notification.delete
    redirect_to notifications_url, notice: 'Notification was successfully destroyed.'
  end

  private
    def set_notification
      @notification = Notification.find(params[:id])
    end

    def notification_params
      params.require(:notification).permit(:topic_id, :title, :link, :text)
    end
end
