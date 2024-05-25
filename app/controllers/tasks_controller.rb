class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authorize_task, only: %i[show edit update destroy]

  # GET /projects/:project_id/tasks
  def index
    @tasks = @project.tasks
  end

  # GET /projects/:project_id/tasks/:id
  def show
  end

  # GET /projects/:project_id/tasks/new
  def new
    @task = @project.tasks.build
    authorize @task
  end

  # GET /projects/:project_id/tasks/:id/edit
  def edit
  end

  # POST /projects/:project_id/tasks
  def create
    @task = @project.tasks.build(task_params)
    authorize @task
    
    if @task.save
      redirect_to [@project, @task], notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /projects/:project_id/tasks/:id
  def update
    if @task.update(task_params)
      redirect_to [@project, @task], notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /projects/:project_id/tasks/:id
  def destroy
    @task.destroy
    redirect_to project_tasks_url(@project), notice: 'Task was successfully destroyed.'
  end

  private
    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_task
      @task = @project.tasks.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :description, :status, :story_point, :start_date, :end_date, :assigned_to_id)
    end

    def authorize_task
      authorize @task
    end
end
