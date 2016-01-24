class AddFaxNoToClients < ActiveRecord::Migration
  def change
  	add_column :clients, :fax_no, :string 
  end
end
