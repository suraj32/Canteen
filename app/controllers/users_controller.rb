class UsersController < ApplicationController
  def index
  end

  def index1
  	@canteen = Canteen.find(params[:canteen_id])
  	@users = @canteen.users.all
  end

  def new
  	@canteen = Canteen.find(params[:canteen_id])
  	@user = @canteen.users.new
  end

  def create
  	@canteen = Canteen.find(params[:canteen_id])
    @user = @canteen.users.create(user_params)
    redirect_to canteens_path
  end

  def edit
  	@canteen = Canteen.find(params[:canteen_id])
  	@user = @canteen.users.find(params[:id])
  end

  def update
  	@canteen = Canteen.find(params[:canteen_id])
 		@user = @canteen.users.find(params[:id])
    if @user.update(user_params)
      redirect_to canteen_admins_path(@canteen)
  	else
    	render 'edit'
  	end
  end

  def destroy
  	@canteen = Canteen.find(params[:canteen_id])
  	@user = @canteen.users.find(params[:id])
  	@user.destroy
 
  	redirect_to canteen_admins_path(@canteen)
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email, :password)
  	end
end
