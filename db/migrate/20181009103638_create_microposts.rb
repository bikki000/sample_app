class CreateMicroposts < ActiveRecord::Migration
  def up
    create_table :microposts do |t|
      t.string :content
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :microposts, [:user_id, :created_at]
  end

  def down
  	remove_index :microposts, [:created_at, :user_id]
  	remove_column :microposts, :updated_at
  	remove_column :microposts, :created_at
  	remove_column :microposts, :user_id
  	remove_column :microposts, :content
  	drop_table :microposts
  end

end
