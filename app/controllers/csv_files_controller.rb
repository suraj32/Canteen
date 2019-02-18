class CsvFilesController < ApplicationController
	def index
    @csv_files = CsvFile.all
  end

  def show
    @csv_file = CsvFile.find(params[:id])
  end
  
  def new
    @csv_file = CsvFile.new
  end

  def create
    @csv_file = CsvFile.new(csv_file_params) do |t|
      if params[:csv_file][:data]
        t.data      = params[:csv_file][:data].read
        t.filename  = params[:csv_file][:data].original_filename
        t.mime_type = params[:csv_file][:data].content_type
      end
    end
    
    if @csv_file.save
    	InviteAdminsJob.perform_now(@csv_file.id)
      redirect_to( @csv_file, :notice => 'csv_file was successfully created.')
    else
      render :action => "new"
    end
  end
  
  def destroy
    @csv_file = csv_file.find(params[:id])
    @csv_file.destroy
    redirect_to(csv_files_url)
  end

  private
  	def csv_file_params
			params.require(:csv_file).permit(:name, :data)
		end
end
