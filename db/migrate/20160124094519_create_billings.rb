class CreateBillings < ActiveRecord::Migration
  def change
    create_table :billings do |t|
      t.integer :client_id
      t.integer :project_id
      t.float :total_amount

      t.timestamps null: false
    end
  end
end
