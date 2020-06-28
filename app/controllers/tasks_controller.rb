class TasksController < ApplicationController
  before_action :logged_in_user, only:[:create, :edit, :destroy]
  before_action :correct_user,only: [:destroy,:show,:update,:edit]


  def new
  	@task = Task.new
  end

def show
  @current_task_time = @task.elapsed_time
  gon.current_task_time = @task.elapsed_time
end


  def index
    @tasks = current_user.tasks
     if params[:id].present?
      correct_user
    else
      @task = Task.new
  end
end

  def create
  	@task = current_user.tasks.build(task_params)
  		if @task.save
  			redirect_to root_url
  		else
        
  			redirect_to root_url
  		end
  end

  def edit
  end

  def update
  	if @task.update(task_params)
      redirect_to root_url
  	else
  		redirect_to root_url
  	end
  end

  def destroy
  	@task.destroy
  	redirect_to root_url
  end

  private
  	def task_params
  		params.require(:task).permit(:content,:elapsed_time)
  	end



    def correct_user
      @task = current_user.tasks.find_by(id: params[:id])
    end
end
