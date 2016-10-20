class SubscribesController < ApplicationController
  before_action :set_subscribe

  def edit
  end

  def update

  end

  def destroy
    @subscribe.delete
    redirect_to :back, notice: 'Подписка успешно удалена'
  end

  private

  def set_subscribe
    @subscribe = Subscribe.find(params[:id])
  end
end
