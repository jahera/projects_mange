class Api::V1::TasksController < Api::V1::BaseController
	before_action :set_project
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authorize_task, only: %i[show edit update destroy]

  # GET /projects/:project_id/tasks
  def index
    @tasks = @project.tasks
    render json: @tasks
  end

  # GET /projects/:project_id/tasks/:id
  def show
  end

  # POST /projects/:project_id/tasks
  def create
    @task = @project.tasks.build(task_params)
    authorize @task
    
    if @task.save
    	render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /projects/:project_id/tasks/:id
  def update
    if @task.update(task_params)
      render json: @task
    else
    	render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /projects/:project_id/tasks/:id
  def destroy
  	authorize @task 
    @task.destroy
    if @task.destroy!
      render json: { message: 'Task was successfully deleted.' }, status: "200"
    else
      render json: @project.errors, status: :unprocessable_entity
    end
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
