class CustomersController < ApplicationController

	def index
		@canteen = Canteen.find(params[:canteen_id])
		@customers = @canteen.customers.all
	end

	def new
		@canteen = Canteen.find(params[:canteen_id])
		@customer = @canteen.customers.new
	end

	def show
		@canteen = Canteen.find(params[:canteen_id])
		@customer = @canteen.customers.find(params[:id])
	end

	def edit
		@canteen = Canteen.find(params[:canteen_id])
		@customer = @canteen.customers.find(params[:id])
	end

	def create
		@canteen = Canteen.find(params[:canteen_id])
		@customer = @canteen.customers.new(customer_params)
		if @customer.save
			redirect_to @customer
		else
			render 'new'
		end
	end

	def update
		@canteen = Canteen.find(params[:canteen_id])
		@customer = @canteen.customers.find(params[:id])

		if @customer.update(customer_params)
    	redirect_to canteen_customers_path(@canteen)
  	else
    	render 'edit'
  	end
	end

	def destroy
		@canteen = Canteen.find(params[:canteen_id])
  	@customer = @canteen.customers.find(params[:id])
  	@customer.destroy
  	redirect_to canteen_customers_path(@canteen)
	end

	private
  def customer_params
    params.require(:customer).permit(:name, :age, :phone_no, :address)
  end
end
