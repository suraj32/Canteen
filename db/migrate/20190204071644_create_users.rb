class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :type
      t.references :canteen, foreign_key: true

      t.timestamps
    end
  end
end
