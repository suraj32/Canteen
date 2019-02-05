class Payment < ApplicationRecord
	validates :amounts, numericality: { only_integer: true }
  belongs_to :membership
end
