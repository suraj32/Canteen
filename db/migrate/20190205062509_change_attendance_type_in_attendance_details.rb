class ChangeAttendanceTypeInAttendanceDetails < ActiveRecord::Migration[5.2]
  def change
  	change_column :attendance_details, :attendance, :text
  end
end
