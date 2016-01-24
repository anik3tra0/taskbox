class Client < ActiveRecord::Base
	has_many :projects
	belongs_to :user

	validates_presence_of :name, :company
	validates_presence_of :website, message: "Contact us if you require a website"
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, allow_blank: true
	validates_numericality_of :mobile
	validates_length_of :mobile, is: 10

end




=begin
	def list_projects
		Project.where('client_id = ?', id)
	end
=end