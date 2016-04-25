class ShiftsController < ApplicationController
load_and_authorize_resource
  before_action :find_shift, only: [:show, :edit, :update, :destroy]

  def index 
    @shifts = Shift.all
    @shift = Shift.new
    # @shifts_by_date = @shifts.group_by(&:date)
    @date = params[:start_time] ? Date.parse(params[:start_time]) : Date.today
    
  end

  def show
  end

  def new
    @shift = Shift.new
  end

  def create
    @shift = Shift.new(shift_params)
    respond_to do |format|
      if @shift.save
        format.html { redirect_to @shift, notice: 'Shift was successfully created.' }
        format.json { render action: 'show', status: :created, location: @shift }
      else
        format.html { render action: 'new' }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @shift.update(shift_params)
        format.html { redirect_to @shift, notice: 'Shift was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @shift.destroy
    redirect_to shifts_path
  end

  private
 
  def find_shift
    #@shift = current_user.shifts.find(params[:id])
    #@shift = current_user.shifts.find(params[:id])
    @shift = Shift.find(params[:id])
  end

  def shift_params
    params.require(:shift).permit(:date, :start_time, :end_time, :department, :break, :user_id)
  end


end