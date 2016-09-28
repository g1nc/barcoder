class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = current_user.events.order(date: :asc)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to edit_event_path(@event), notice: 'Событие успешно создано'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to edit_event_path(@event), notice: 'Событие успешно изменено'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to :back, notice: 'Событие успешно удалено'
    else
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:topic_id, :title, :description, :date)
    end
end
