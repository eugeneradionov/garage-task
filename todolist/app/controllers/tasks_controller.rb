class TasksController < ApplicationController

  def new
    respond_to do |format|
      format.html
      format.js { @project.id }
    end
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.create(task_params)
    respond_to do |format|
      format.html {redirect_to projects_path}
      format.js { @project }
    end
  end

  def update
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])

    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to projects_url, notice: 'Task was successfully updated.' }
        format.js { @task }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { redirect_to projects_url }
        format.js
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])

    respond_to do |format|
      format.html
      format.js { @task }
    end
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
      format.js { @task }
    end

  end

  def complete
    @task = Task.find(params[:id])
    @task.completed = !@task.completed
    @task.save

    respond_to do |format|
      format.html {redirect_to projects_path}
      format.js { @task }
    end
  end

  def deadline
    @task = Task.find(params[:id])
    @task.deadline = Date.parse(params[:task][:deadline])
    @task.save
    respond_to do |format|
      format.html {redirect_to projects_path}
      format.js { @task }
    end
  end

  def deadline_show
    @task = Task.find(params[:id])
    respond_to do |format|
      format.html {redirect_to projects_path}
      format.js { @task }
    end
  end

  def sort
    params[:task].each_with_index do |id, index|
      Task.where('id = ?', id).update_all({priority: index+1})
    end

    respond_to do |format|
      #format.html {redirect_to projects_path}
      format.js { @project = Project.find(params[:project_id]) }
    end
  end

  private
    def task_params
      params.require(:task).permit(:name, :project_id, :deadline => [])
    end
end
