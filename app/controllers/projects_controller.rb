class ProjectsController < ApplicationController

	#layout 'clients'
	load_and_authorize_resource
	before_filter :authenticate_user!

	def index
		if params[:status].nil?
			@projects = current_user.projects.paginate(page: params[:page], per_page: 5)
		elsif params[:status] == "new"
			@projects = current_user.projects.where('status = ?', params[:status])
		elsif params[:status] == "completed"
			@projects = current_user.projects.where('status = ?', "completed")
		else 
			@projects = []
		end
	end

	def new
		@project = Project.new
		render layout: 'application'
	end

	def show
		begin
			@project = Project.find(params[:id])
			@task = Task.new
		rescue ActiveRecord::RecordNotFound
			redirect_to projects_path, notice: "Project does not exist"
		end
	end

end
