class RequestsController < ApplicationController
	before_action :find_request, only: [:show, :edit, :update, :destroy]
	def index
		@requests = Request.all
	end

	def new
		@requests = Request.new
	end

	def create
		@request = Request.new(request_params)
		if @request.save
		flash[:notice] = "availability is created" 
        redirect_to root_path
    	else 
    	render :action => 'new'
		end
	end

	def show 
	end

  	def update
	    if @request.update(request_params)
	      redirect_to @request
	  	else
	      render 'edit'
	  	end
  	end

	 def destroy
	    @request = Request.find(params[:id])
	    if @request.destroy
	      flash[:notice] = "Successfully deleted availability"
	      redirect_to root_path
	    end
	 end

    private
 
  def find_request

    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:date, :start_time, :end_time, :department, :break, :user_id)
  end

end