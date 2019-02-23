require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
  	let!(:user) {build(:user)}
  	it 'ensure presence of user_name' do
			user.name = nil
			expect(user).to_not be_valid
		end
		it 'ensure inclusion of user_role' do
			user.role = 'admin'
			expect(user).to_not be_valid
		end
		it 'ensure presence of user_email' do
			user.email = nil
			expect(user).to_not be_valid
		end
		it 'ensure format of user_email' do
			user.email = '@1.net'
			expect(user).to_not be_valid
		end
		it 'ensure presence of password' do
			user.password = nil
			expect(user).to_not be_valid
		end
		it 'ensure length of password' do
			user.password = 'abc1'
			expect(user).to_not be_valid
		end
  end

  describe 'Callbacks' do
  	let!(:user) {build(:user)}
  	it 'change nil user role to CanteenAdmin' do
  		user.role = nil
  		expect(user).to be_valid
  	end
  end
end