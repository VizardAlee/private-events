class EventsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def index
    @events = Event.all
    @event_attendances = EventAttendance.all
  end

  def show
    @event = Event.includes(:created_by).find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :event_date)
  end
end
