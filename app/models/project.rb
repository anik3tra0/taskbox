class Project < ActiveRecord::Base
	belongs_to :user
	# has_many :join_table
	# has_many :associated_table, through: :join_table

	has_many :project_categories
	has_many :categories, through: :project_categories

	belongs_to :client	

	has_many :tasks, dependent: :destroy

	validates_presence_of :name, :description
	validates :status, presence: true

	validates_length_of :description, maximum: 100

end



=begin
	def details
		"#{name} - #{status} - #{start_date} - #{Client.find(client_id).name}"
	end


	def self.list_new_projects
		Project.where('status = ?', 'new')
	end

	def list_tasks
		Task.where('project_id = ?', id)
	end
=end