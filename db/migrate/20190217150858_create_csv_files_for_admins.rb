class CreateCsvFilesForAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :csv_files_for_admins do |t|

      t.timestamps
    end
  end
end
