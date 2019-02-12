class MembershipsController < ApplicationController
	def index
		@memberships = Canteen.Membership.all
	end

	def create

	end
	def new
		@canteen = Canteen.find(params[:canteen_id])
		redirect_to new_canteen_membership_customer_path()
		#@membership = @canteen.Membership.create()
	end
end
