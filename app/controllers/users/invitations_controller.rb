class Users::InvitationsController < Devise::InvitationsController

	def new
		@canteen = Canteen.find params[:canteen_id]
		super
	end

	def resource_params
    params.require(:user).permit(:name, :email,
    	:invitation_token, :canteen_id)
  end
end