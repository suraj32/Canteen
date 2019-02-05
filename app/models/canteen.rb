class Canteen < ApplicationRecord
	has_one :user
	has_many :attendance_details
	has_many :memberships
end
