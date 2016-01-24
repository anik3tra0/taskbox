class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.string :name
    	t.text :description
    	t.date :start_date
    	t.string :status

    	#t.datetime :created_at
    	#t.datetime :updated_at

      t.timestamps null: false


      #t.integer :team_size
      #t.float :budget
      #t.boolean :is_completed
    end
  end
end
