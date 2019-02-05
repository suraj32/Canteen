class User < ApplicationRecord
  belongs_to :canteen, optional: true
end
