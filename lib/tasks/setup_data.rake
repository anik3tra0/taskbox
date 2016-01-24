desc "Fake data"
task :setup_data => :environment do 
	15.times do
		client = Client.new
		client.name = Faker::Name.first_name
		client.company = Faker::Company.name
		client.email = Faker::Internet.free_email(client.name)
		client.mobile = Faker::Number.number(10)
		client.user_id = User.all.pluck(:id).first(2).shuffle.first
		client.save(validate: false)
		rand(1..5).times do 
			project = Project.new
			project.name = Faker::App.name
			project.description = Faker::Lorem.paragraph
			project.start_date = Faker::Date.between(Date.today.beginning_of_year, Date.tomorrow)
			project.status = ["new","completed", "on-going", "archieved"].shuffle.first
			project.client_id = client.id
			project.user_id = client.user_id 
			project.save(validate: false)
			rand(1..5).times do 
				task = Task.new
				task.name = ["vendor finalization", "hosting finalization", "client approval", "client meeting", "cms design"].shuffle.first
				task.due_date = Faker::Date.between(project.start_date, Date.today + 1.month)
				task.is_completed = [true,false].shuffle.first
				task.project_id = project.id
				task.user_id = project.user_id 
				task.save(validate: false)
			end
		end
	end
end