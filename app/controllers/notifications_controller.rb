class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @notifications = current_user.notifications
  end

  def new
    @notification = current_user.notifications.build
  end

  def create
    @notification = current_user.notifications.build(notification_params)
    if @notification.save
      redirect_to edit_notifications_path(@notification), notice: 'Уведомление успешно создано'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @notification.update(notification_params)
      redirect_to edit_notifications_path(@notification), notice: 'Уведомление успешно изменено'
    else
      render :edit
    end
  end

  def destroy
    @notification.delete
    redirect_to :back, notice: 'Уведомление успешно удалено'
  end

  private
    def set_notification
      @notification = Notification.find(params[:id])
    end

    def notification_params
      params.require(:notification).permit(:topic_id, :title, :link, :text)
    end
end
