class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |airport| [airport.code, airport.id] }
    @date_options = Flight.all.map { |flight| flight.scheduled_on.to_date }.uniq
  end
end
