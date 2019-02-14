class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(user)
 		canteens_index_path
	end

  def after_invite_path_for(user)
    canteens_index_path
  end

  def after_accept_path_for(user)
    accept_user_invitation_path
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit(:invite, keys: [:email, :canteen_id])
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:name, :password, :password_confirmation])
  end
end
