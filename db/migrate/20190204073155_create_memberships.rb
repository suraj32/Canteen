class CreateMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :memberships do |t|
      t.boolean :active, default: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
