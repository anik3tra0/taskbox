class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
	validates_presence_of :project_id
	validates_numericality_of :project_id
	#validate :check_due_date


	private 

	def check_due_date
		if !(due_date).nil? && due_date < project.start_date
			errors.add(:due_date, " of task should be greater than #{project.start_date}")
		end
	end

end
