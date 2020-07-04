class StaticPagesController < ApplicationController
  def home
  	if logged_in?
  		@task = current_user.tasks.build
  		@to_do_tasks =current_user.tasks.where(done: 0).order(id: "DESC")
  		@done_tasks = current_user.tasks.where(done: 1 ).order(id: "DESC")
  		@done = current_user.tasks.select(:done).find_by(id: params[:id])
  	end
  end

  def about
  end

  def create
    user = User.find_by(email: 'guest@example.com')
    log_in user
    flash[:success] = "log in as guest user."
    redirect_to root_url
  end

end


