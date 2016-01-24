desc "Setup app roles"
task :setup_roles => :environment do 
	Role.create(name: "super_admin")
	Role.create(name: "admin")
	Role.create(name: "user")
end