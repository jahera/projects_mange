class Api::V1::ProjectsController < Api::V1::BaseController
	before_action :set_project
  before_action :set_project, only: %i[show edit update destroy]
  before_action :authorize_project, only: %i[show edit update destroy]

  # GET/projects.json
  def index
    @projects = policy_scope(Project)
    render json: @projects
  end

  # GET /p@projects = policy_scope(Project)rojects/1.json
  def show
  end

  # POST /projects.json
  def create
    @project = current_user.projects.new(project_params)
    authorize @project

    if @project.save
    	render json: @project, status: :created
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /projects/1.json
  def update
  	if @project.update(project_params)
      render json: @project
    else
    	render json: @project.errors, status: '401'
    end
  end

  # DELETE /projects/1.json
  def destroy
    authorize @project 
    if @project.destroy!
      render json: { message: 'Project was successfully deleted.' }, status: "200"
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:title, :description, :status, :start_date, :end_date, :user_id)
    end

    def authorize_project
      authorize @project
    end
end
