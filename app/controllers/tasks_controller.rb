class TasksController < ApplicationController
  def index
    @incomplete_tasks = Task.where(complete: false).paginate(:page => params[:page], :per_page => 10)
    @complete_tasks = Task.where(complete: true)
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      respond_to do |format|
        format.html { redirect_to tasks_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.js { render :js=>"alert('#{@task.errors.full_messages}');" }
      end
    end  
  end

  def update
    @task = Task.find(params[:id])
    @task.assign_attributes(task_params)
    @task.complete_changed = true if @task.complete_changed?
    if @task.save
      respond_to do |format|
        format.html { redirect_to tasks_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'edit' }
        format.js { render js: "alert('#{@task.errors.full_messages}');" }
      end
    end
  end

  def destroy
    @task = Task.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to tasks_path }
      format.js
    end
  end

  private
  def task_params
    params.require(:task).permit(:name, :complete)
  end
end
