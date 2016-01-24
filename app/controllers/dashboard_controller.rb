class DashboardController < ApplicationController
	before_filter :authenticate_user!
  def index
  	@clients_count = is_admin? ? Client.count : current_user.clients.size
  	@projects_count = is_admin? ? Project.count : current_user.projects.size
  	@tasks_count = is_admin? ? Task.count : current_user.tasks.size
  end
end
