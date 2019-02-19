class InviteAdminsJob < ApplicationJob
  queue_as :default
  require 'csv'

  def perform(csv_file_id)
    csv_file = CsvFile.find(csv_file_id)
  	csv = CSV.parse(csv_file.data, :headers => true)
    new_csv = CSV.generate do |new_csv|
      new_csv << ['Email', 'Canteen name', 'Inserted or not']
    	csv.each do |row|
        # add in hand data i.e email n canteen name
        # then processing 
        # insert only processing starus
        canteen = Canteen.find_by(name: row["Canteen name"])
    		if canteen && row["Email"]
          User.invite!(email: row["Email"], canteen_id: canteen.id)
          new_csv << [row["Email"], row["Canteen name"], 'Yes']
    		else
    			new_csv << [row["Email"], row["Canteen name"], 'No']
    		end
    	end
    end
  	UserMailer.with(content: new_csv).send_csv_report.deliver_later
  end
end