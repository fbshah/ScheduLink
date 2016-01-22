class ShiftsController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!
  before_action :find_shift, only: [:show, :edit, :update, :destroy]

  def index 
    @shifts = Shift.all
    @shifts = @shifts.where(user_id: current_user) 
  end

  def show
  end

  def new
    @shift = current_user.shift.build
  end

  def create
    @shift = current_user.shifts.build(shift_params)
    if @shift.save
    redirect_to @shift
  else
    render 'new'
  end
  end

  def edit
  end

  def update
    if @shift.update(shift_params)
      redirect_to @shift
  else
      render 'edit'
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
    params.require(:shift).permit(:start_time, :end_time, :department, :break)
  end


end