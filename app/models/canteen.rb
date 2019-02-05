class Canteen < ApplicationRecord
	validates :name, presence: true, length: { minimum: 4 }
	has_one :user
	has_many :attendance_details
	has_many :memberships
end
