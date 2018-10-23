class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end

  def down
  	remove_column :users, :updated_at
  	remove_column :users, :created_at
  	remove_column :users, :email
  	remove_column :users, :name

  	drop_table :users
  end

end
