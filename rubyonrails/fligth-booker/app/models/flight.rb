class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport", foreign_key: "from_airport_id"
  belongs_to :arrival_airport, class_name: "Airport", foreign_key: "to_airport_id"
end
