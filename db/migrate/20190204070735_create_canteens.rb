class CreateCanteens < ActiveRecord::Migration[5.2]
  def change
    create_table :canteens do |t|
      t.string :name

      t.timestamps
    end
  end
end
