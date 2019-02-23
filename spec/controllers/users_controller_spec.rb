require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	# describe 'GET #index_for_canteen_admins' do
	# 	let!(:user) {build(:user)}
	# 	it "returns a success response" do
 #      get :canteen_admins_path, params: {id: user.to_param}
 #      expect(response).to be_successful
 #    end
	# end

	describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_successful
    end
  end
end
