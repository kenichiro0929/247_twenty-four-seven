class SituationsController < ApplicationController
	before_action :logged_in_user, only:[:edit,:destroy,:update]
  before_action :set_task, only:[:update]



def edit
end

def update
  @task.update(set_params)
  @done_tasks = current_user.tasks.where(done: 1 )
  @to_do_tasks =current_user.tasks.where(done: 0)
end



private

  def set_params
      params.require(:task).permit(:done,:content,:elapsed_time)
    end

  def correct_user
    @task = current_user.tasks.find_by(id: params[:task_id])
  end

  def set_task
    @task = current_user.tasks.find_by(id: params[:task_id])

  end


  def done
    current_user.tasks.select(:done)
  end


end



