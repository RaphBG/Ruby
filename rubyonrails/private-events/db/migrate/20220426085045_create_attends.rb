class CreateAttends < ActiveRecord::Migration[7.0]
  def change
    create_table :attends do |t|

      t.timestamps
    end
    add_reference :attends, :attendee, index: true
    add_reference :attends, :attended_event, index: true
  end
end
