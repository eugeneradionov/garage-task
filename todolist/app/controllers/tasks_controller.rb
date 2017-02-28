class TasksController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.create(task_params)
    redirect_to projects_path
  end

  def update
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])

    if @task.update(task_params)
      redirect_to projects_path
    else
      render 'edit'
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end

  def show
  end

  def index
  end

  def destroy
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    @task.destroy
    redirect_to projects_path
  end

  def complete
    @task = Task.find(params[:id])
    @task.completed = !@task.completed
    @task.save
    redirect_to projects_path
  end

  def sort
    params[:task].each_with_index do |id, index|
      Task.where('id = ?', id).update_all({priority: index+1})
    end
  end

  private
    def task_params
      params.require(:task).permit(:name)
    end
end
