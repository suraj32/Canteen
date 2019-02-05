class AttendanceDetail < ApplicationRecord
  belongs_to :canteen
  belongs_to :customer
end
