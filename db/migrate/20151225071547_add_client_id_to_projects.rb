class AddClientIdToProjects < ActiveRecord::Migration
  def change
  	#add_column :table_name, column_name, :column_type
  	add_column :projects, :client_id, :integer 
  	


  	#remove_column :table_name, :column_name
  end
end
