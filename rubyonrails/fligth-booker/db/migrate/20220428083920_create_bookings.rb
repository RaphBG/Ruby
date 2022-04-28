class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|

      t.timestamps
    end
    add_reference :bookings, :flight, foreign_key: true
  end
end
