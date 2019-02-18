class InviteAdminsJob < ApplicationJob
  queue_as :default

  def perform(csv_file_id)
    @csv_file = CsvFile.find(csv_file_id)
  	require 'csv'
  	csv = CSV.parse(@csv_file.data, :headers => true)
  	csv.each do |row|
  		canteen = Canteen.find_by(name: "#{row.fetch('Canteen name')}")
      User.invite!(email: "#{row.fetch('Email')}", canteen_id: canteen.id)
  	end
  end
end