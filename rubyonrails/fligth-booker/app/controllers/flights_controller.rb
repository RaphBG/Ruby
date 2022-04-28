class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |airport| [airport.code, airport.id] }
    @date_options = Flight.all.map { |flight| flight.scheduled_on.to_date }.uniq
    if params.has_key?(:date)
      @selected_date = params[:date].to_date
      @available_flights = Flight.where(from_airport_id: params[:from_airport_id], to_airport_id: params[:to_airport_id], scheduled_on: @selected_date.all_day)
    end
  end
end
