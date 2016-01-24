class ClientsController < ApplicationController
	load_and_authorize_resource
	before_filter :authenticate_user!
	
	#before_action :authenticate_user!, except: [:index]

	def index
		@clients = is_admin? ? Client.all : current_user.clients
	end

	def new
		@client = Client.new
	end

	def create
		@client = Client.new(client_params)
		@client.user_id = current_user.id
		if @client.save
			redirect_to client_path(@client), notice: "Successfully created the client #{@client.name}"
		else
			render action: 'new'
		end
	end

	def edit
		begin
			@client = is_admin? ? Client.find(params[:id]) : current_user.clients.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			redirect_to clients_path, notice: "Record doesn't exit"
		end
	end

	def update
		@client = is_admin? ? Client.find(params[:id]) : current_user.clients.find(params[:id])
		@client.user_id = current_user.id if !is_admin?
		if @client.update_attributes(client_params)
			redirect_to client_path(@client), notice: "Successfully updated the client"
		else
			render action: 'edit'
		end
	end

	def show
		begin
			@client = is_admin? ? Client.find(params[:id]) : current_user.clients.find(params[:id])
			@new_projects = @client.projects.where('status = ?', "new")
			@completed_projects = @client.projects.where('status = ?', "completed")
			@archieved_projects = Project.where('client_id = ? AND status = ?', @client.id, "archieved")
			@on_going_projects = @client.projects.where('status = ?', "on-going")
		rescue ActiveRecord::RecordNotFound 
			redirect_to clients_path, notice: "The record doesn't exist"
		end
	end

	def destroy
		@client = current_user.clients.find(params[:id])
		@client.destroy
		redirect_to clients_path, notice: "#{@client.name} has been deleted"
	end

	private

	def client_params
		params[:client].permit(:name, :company, :email, :mobile, :website)
	end

end
