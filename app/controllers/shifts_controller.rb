class ShiftsController < ApplicationController
  before_action :authenticate_user!

  def index
    @shifts = Shift.all
  end

  # Sets up a blank shift in memory for the form to use
  def new
    @shift = Shift.new
  end

  # Takes the submitted form data and saves it to the database
  def create
    # current_user is a Devise helper that automatically links the shift to whoever is logged in!
    @shift = current_user.shifts.build(shift_params)
    
    if @shift.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @shifts = Shift.all
  end

  def show
    @shift = Shift.find(params[:id])
    @task = Task.new # This creates a blank task in memory so our form has something to use!
  end

  def destroy
    # 1. Find the exact shift using the ID passed in the URL
    @shift = Shift.find(params[:id])
    
    # 2. Delete it from the database
    @shift.destroy
    
    # 3. Send the user back to the homepage
    # (The status: :see_other part is required in Rails 7 to refresh the page correctly)
    redirect_to root_path, status: :see_other
  end

  private

  # Security feature: strictly controls exactly what data the form is allowed to send
  def shift_params
    params.require(:shift).permit(:date, :shift_type, :notes)
  end
end