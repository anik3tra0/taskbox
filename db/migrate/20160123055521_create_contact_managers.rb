class CreateContactManagers < ActiveRecord::Migration
  def change
    create_table :contact_managers do |t|
      t.string :first_name
      t.string :last_name
      t.string :mobile
      t.string :email

      t.timestamps null: false
    end
  end
end
