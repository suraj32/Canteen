class InviteAdminsJob < ApplicationJob
  queue_as :default
  require 'csv'

  def perform(csv_file_id)
    csv_file = CsvFile.find(csv_file_id)
    csv = CSV.parse(csv_file.data, :headers => true)
    new_csv = CSV.generate do |new_csv|
      new_csv << ['Email', 'Canteen name', 'Status']
      csv.each do |row|
        canteen = Canteen.find_by(name: row["Canteen name"])
        if canteen
          if row["Email"]
            user = User.find_by(email: row['Email'])
            if user && !user.invitation_token
              new_csv << [row["Email"], row["Canteen name"], 'Admin with email already exist']
            else
              user = User.invite!(email: row["Email"], canteen_id: canteen.id)
              if user.errors.messages == {}
                new_csv << [row["Email"], row["Canteen name"], 'Admin successfully invited']
              else
                new_csv << [row["Email"], row["Canteen name"], "Email #{user1.errors.messages[:email].join()}"]
              end
            end
          else
            new_csv << [row["Email"], row["Canteen name"], 'Email is blank']
          end
        else
          new_csv << [row["Email"], row["Canteen name"], 'Invalid canteen name']
        end
      end
    end
    UserMailer.with(content: new_csv).send_csv_report.deliver_now
  end
end