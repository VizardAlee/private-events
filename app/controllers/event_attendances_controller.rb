class EventAttendancesController < ApplicationController
  before_action :set_event_attendances
  
  def create
    event = Event.find(params[:event_id])
    current_user.attended_events << event
    redirect_to event, notice: 'You are now attending the event.'
  end

  def destroy
    attendance = EventAttendance.find(params[:id])
    attendance.destroy
    redirect_to attendance.event, notice: 'You are no longer attending the event.'
  end

  def index
    @event_attendances = @event.event_attendances
  end

  private
  def set_event_attendances
    @event = Event.find(params[:event_id])
    puts @event_attendances = @event.event_attendances
  end
end
