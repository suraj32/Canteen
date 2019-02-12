class CustomersController < ApplicationController
	def new
		@customer = Customer.new
		@canteen = Canteen.find(params[:canteen_id])
	end

	def create
		@customer = Customer.new(customer_params)
		unless @customer.save
			render 'new'
		end
	end

	private
  def customer_params
    params.require(:customer).permit(:name, :age, :phone_no, :address)
  end
end
