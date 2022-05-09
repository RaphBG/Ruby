class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.references :from_airport, foreign_key: { to_table: :airports }
      t.references :to_airport, foreign_key: { to_table: :airports }, index: { name: 'to_airport' }
      t.integer :duration
      t.datetime :scheduled_on
      
      t.timestamps
    end
  end
end
