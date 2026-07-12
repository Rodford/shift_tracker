class TasksController < ApplicationController
  before_action :authenticate_user!

  def create
    @shift = Shift.find(params[:shift_id])
    @task = @shift.tasks.build(task_params)
    
    if @task.save
      redirect_to shift_path(@shift)
    else
      redirect_to shift_path(@shift), alert: "Task couldn't be saved."
    end
  end

  def toggle
    @shift = Shift.find(params[:shift_id])
    @task = @shift.tasks.find(params[:id])
    
    @task.update(
      is_completed: !@task.is_completed,
      completed_at: @task.is_completed ? nil : Time.current
    )
    
    # Using status: :see_other ensures Turbo handles the redirect correctly
    redirect_to shift_path(@shift), status: :see_other
  end

  def destroy
    @shift = Shift.find(params[:shift_id])
    @task = @shift.tasks.find(params[:id])
    
    @task.destroy
    
    redirect_to shift_path(@shift), status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end
end