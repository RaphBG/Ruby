class AttendsController < ApplicationController
  def new
    @event = Event.find(params[:id])
    @event.attendees << current_user
    redirect_to event_path(@event)
  end

  def destroy
    @attend = Attend.find_by("attendee_id = ? AND attended_event_id = ?", current_user.id, params[:id])
    @attend.destroy
    redirect_to profile_path
  end
end
