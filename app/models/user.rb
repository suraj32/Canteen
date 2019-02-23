class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :invitable
	validates :name, presence: true
	validates :role, inclusion: { in: %w(Admin CanteenAdmin), message: "%{value} is not a valid user" }
  belongs_to :canteen, optional: true

  before_validation do
  	self.role = 'CanteenAdmin' if role.blank?
  end
end
