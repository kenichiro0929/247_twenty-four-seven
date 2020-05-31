class TasksController < ApplicationController
  before_action :logged_in_user, only:[:create, :edit, :destroy]
  before_action :correct_user,only: :destroy

  def new
  	@task = Task.new
  end

  def index
    
    @task = Task.new
  end

  def create
  	@task = current_user.tasks.build(task_params)
  		if @task.save
        flash[:success] = "task created"
  			redirect_to root_url
  		else
  			redirect_to root_url
  		end
  end

  def edit
 	@task = Task.find(params[:id])
  end

  def update
  	@task = Task.find(params[:id])
  	if @task.update(task_params)
  		render '/tasks'
  	else
  		render '/tasks'
  	end
  end

  def destroy
  	@task.destroy
  	redirect_to root_url
  end

  private
  	def task_params
  		params[:task].permit(:content)
  	end

    def correct_user
      @task = current_user.tasks.find_by(id: params[:id])
    end
end
