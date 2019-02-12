class Canteen < ApplicationRecord
	validates :name, presence: true, length: { minimum: 4 }
	has_many :users
	has_many :customers
end
