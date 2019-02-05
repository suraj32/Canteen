class Customer < ApplicationRecord
	validates :name, :age, :phone_no, presence: true
	has_many :attendance_details
	has_many :memberships
end
