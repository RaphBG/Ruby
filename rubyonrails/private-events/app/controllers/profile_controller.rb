class ProfileController < ApplicationController
  def show
    @events = current_user.events
    @attended_events = current_user.attended_events
  end
end
