class EventsController < ApplicationController
  def index
    @future_events = Event.all.upcoming
    @past_events = Event.all.attended
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      @event.attendees << current_user
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def event_params
      params.require(:event).permit(:name, :location, :date, :user_id)
    end
end
