class Admin::ReportsController < ApplicationController
	before_action :authenticate_user!

	def index
    @projects = Project.all
    @completed_projects = Project.completed
    @ongoing_projects = Project.inprogress
    @tasks = Task.all
  end
end
