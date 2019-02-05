class Membership < ApplicationRecord
	has_many :payments
  belongs_to :canteen
  belongs_to :customer
end
