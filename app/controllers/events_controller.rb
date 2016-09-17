class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.order(:date)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def edit

  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:topic_id, :title, :description, :date)
    end
end
