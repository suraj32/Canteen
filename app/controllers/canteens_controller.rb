class CanteensController < ApplicationController
	def index
		if current_user.role == 'Admin'
			@canteens = Canteen.all
		else current_user.role == 'CanteenAdmin'
			@cid = current_user.canteen_id
			@canteens = Canteen.find_by(id: @cid)
		end
	end

	def show
		@canteen = Canteen.find(params[:id])
	end
	
	def new
		@canteen = Canteen.new
	end

	def edit
  	@canteen = Canteen.find(params[:id])
	end

	def create
		@canteen = Canteen.new(canteen_params)
 
  	if @canteen.save
    	redirect_to canteens_path
  	else
    	render 'new'
  	end
	end

	def update
  	@canteen = Canteen.find(params[:id])
 
  	if @canteen.update(canteen_params)
    	redirect_to canteens_path
  	else
    	render 'edit'
  	end
	end

	def destroy
  	@canteen = Canteen.find(params[:id])
  	@canteen.destroy
 
  	redirect_to canteens_path
	end

	private
  def canteen_params
    params.require(:canteen).permit(:name, :address)
  end
end
