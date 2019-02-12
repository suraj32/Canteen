class UsersController < ApplicationController
  def index
  end

  # def index1
  # 	@canteen = Canteen.find(params[:id])
  # 	@admins = Canteen.users.all
  # end

  def new
  	@canteen = Canteen.find(params[:canteen_id])
  	@user = @canteen.users.new
  end

  def create
  	@canteen = Canteen.find(params[:canteen_id])
    @user = @canteen.users.create(user_params)
    redirect_to canteens_path
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email, :password)
  	end
end
