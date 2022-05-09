class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :flight foreign_key: true
      
      t.timestamps
    end
  end
end
