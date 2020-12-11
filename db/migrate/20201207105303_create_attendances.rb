class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.integer :concerned_event_id
      t.integer :invited_user_id

      t.timestamps
    end
  end
end
