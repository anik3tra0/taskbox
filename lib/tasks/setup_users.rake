desc "Setup dummy users"
task :setup_users => :environment do 
	User.create(email: "aniruddha.s.g@gmail.com", password: "secret123")
	User.create(email: "mani@gmail.com", password: "secret123")
	User.create(email: "admin@gmail.com", password: "secret123")

	Permission.create(user_id: User.first.id, role_id: Role.first.id)
	Permission.create(user_id: User.second.id, role_id: Role.second.id)
	User.third.update_attributes(email: "prasad@gmail.com")
	Permission.create(user_id: User.third.id, role_id: Role.third.id)


end