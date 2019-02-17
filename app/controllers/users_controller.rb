class UsersController < ApplicationController
  def index
  end

  def index1
  	@canteen = Canteen.find(params[:canteen_id])
  	@users = @canteen.users.all
  end

  def canteen_admins_through_csv_view
  end

  def new_through_csv
    require 'csv'
    if params[:canteenAdmins] != nil
      uploaded_io = params[:canteenAdmins]
      if uploaded_io.content_type == 'text/csv'
        File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
          file.write(uploaded_io.read)
        end
        filename = "#{Rails.root}/public/uploads"+'/'+"#{uploaded_io.original_filename}"
        csv_text = File.read(filename)
        csv = CSV.parse(csv_text, :headers => true)
        if csv.empty? == false
          csv.each do |row|
            if((row.length == 2)&&(row.fetch('Email') != nil)&&((Canteen.find_by(name: "#{row.fetch('Canteen name')}")) != nil))
              next
            else
              flash[:danger] = "Some rows are not proper"
              break
            end    
          end
          csv.each do |row|
            canteen = Canteen.find_by(name: "#{row.fetch('Canteen name')}")
            User.invite!(email: "#{row.fetch('Email')}", canteen_id: canteen.id)
          end
          flash[:success] = "Admins imported successfully"
        else
          flash[:danger] = "Please select a file with some data rows"  
        end
      else
        flash[:danger] = "Please select a csv file"  
      end
    else
      flash[:danger] = "Please select a file"
      render 'canteen_admins_through_csv_view'
    end
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
