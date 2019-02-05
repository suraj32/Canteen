class AttendanceDetail < ApplicationRecord
  belongs_to :canteen
  belongs_to :customer

  before_create do
    self.no_of_meals = 0
  end
end
