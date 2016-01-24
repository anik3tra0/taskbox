class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	def is_admin?
		(current_user.email == "admin@gmail.com")? true : false
	end

	before_filter do
	  resource = controller_name.singularize.to_sym
	  method = "#{resource}_params"
	  params[resource] &&= send(method) if respond_to?(method, true)
	end

	rescue_from CanCan::AccessDenied do |exception| 
		redirect_to root_url, notice: "Access Denied"
	end

end