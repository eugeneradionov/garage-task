class TasksController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.create(task_params)
    respond_to do |format|
      format.html {redirect_to projects_path}
    end
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

    respond_to do |format|
      format.html {redirect_to projects_path}
    end

  end

  def complete
    @task = Task.find(params[:id])
    @task.completed = !@task.completed
    @task.save

    respond_to do |format|
      format.html {redirect_to projects_path}
    end
  end

  def sort
    params[:task].each_with_index do |id, index|
      Task.where('id = ?', id).update_all({priority: index+1})
    end
    head :no_content
  end

  def deadline

  end

  private
    def task_params
      params.require(:task).permit(:name, :project_id)
    end
end
