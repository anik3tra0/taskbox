class SayController < ApplicationController

  load_and_authorize_resource
  def hello
  end

  def goodbye
  	
  end

  def sandbox
		@clients = Client.all
		@projects = Project.all
		@tasks = Task.all
  end

  def projects
  	@projects = Project.all
  end
end
