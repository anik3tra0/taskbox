class TasksController < ApplicationController
	load_and_authorize_resource
	before_filter :authenticate_user!

	def mark_as_complete
		@task = Task.find(params[:task_id])
		@task.update_attributes(is_completed: true)
		Notification.notify_completed(@task).deliver!
		redirect_to :back, notice: "Successfully marked the task as complete"
	end

	def mark_as_incomplete
		@task = Task.find(params[:task_id])
		@task.update_attributes(is_completed: false)
		redirect_to :back, notice: "Successfully marked the task as incomplete"
	end

	def create
		@task = Task.new(task_params)
		if @task.save
			redirect_to project_path(@task.project_id), notice: "New Task created"
		end
	end

		private

		def task_params
			params[:task].permit(:name, :due_date, :is_completed, :project_id)
		end

end
