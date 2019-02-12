class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.references :canteen, foreign_key: true
      t.string :name
      t.integer :age
      t.integer :phone_no
      t.string :address
      t.timestamps
    end
  end
end
