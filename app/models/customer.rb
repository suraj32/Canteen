class Customer < ApplicationRecord
	has_many :attendance_details
	has_many :memberships
end
