class CreateAttendanceDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :attendance_details do |t|
      t.integer :no_of_meals
      t.string :attendance
      t.references :canteen, foreign_key: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
