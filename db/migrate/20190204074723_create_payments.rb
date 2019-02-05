class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.integer :amount
      t.references :membership, foreign_key: true

      t.timestamps
    end
  end
end
