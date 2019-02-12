class AddAddressToCanteens < ActiveRecord::Migration[5.2]
  def change
    add_column :canteens, :address, :string
  end
end
