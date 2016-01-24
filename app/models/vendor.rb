class Vendor < ActiveRecord::Base

	def to_param
		"#{company}"
	end

end
