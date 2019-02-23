class CreateCsvFiles < ActiveRecord::Migration[5.2]
  def self.up
    create_table :csv_files do |t|
      t.string :name,         :null => false
      t.binary :data,         :null => false
      t.string :filename
      t.string :mime_type
      t.timestamps
    end
  end

  def self.down
    drop_table :csv_files
  end
end