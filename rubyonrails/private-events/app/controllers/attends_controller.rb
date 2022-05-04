class AttendsController < ApplicationController
  def create
    @event = Event.find(params[:id])
    @event.attendees << current_user
    redirect_to event_path(@event)
  end

  def destroy
    attend = current_user.attends.find_by(attended_event_id: params[:id])
    attend.destroy

    if attend.destroyed?
      message= "Worked"
    else
      message= "Didn't worked"
    end

    redirect_to profile_path, notice: message
  end
end
