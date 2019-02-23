require 'rails_helper'

RSpec.describe Canteen, type: :model do
	describe 'Validations' do
  	let!(:canteen) {build(:canteen)}
  	
  	it 'should be valid canteen' do
      expect(canteen.valid?).to be_truthy
  	end

  	it 'ensure presence of canteen_name' do
			canteen.name = nil
			expect(canteen).to_not be_valid
			expect(canteen.errors['name']).to  eq()
		end
		
		it 'check minimum length of canteen_name' do
			canteen.name = 'abc'
			expect(canteen).to_not be_valid
		end

		it 'check minimum length of canteen_name' do
			canteen.name = 'abcde'
			expect(canteen).to be_valid
		end
  end
end
