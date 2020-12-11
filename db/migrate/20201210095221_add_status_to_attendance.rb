class AddStatusToAttendance < ActiveRecord::Migration[6.0]
  def change
    add_column :attendances, :status, :boolean
  end
end
