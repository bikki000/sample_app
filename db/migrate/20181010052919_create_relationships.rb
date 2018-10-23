class CreateRelationships < ActiveRecord::Migration
  def up
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps null: false
    end
    add_index :relationships, :follower_id
    add_index :relationships, :followed_id
    add_index :relationships, [:follower_id, :followed_id], unique: true
  end

  def down
    remove_index :relationships, [:follower_id, :followed_id]
    remove_index :relationships, :followed_id
    remove_index :relationships, :follower_id

    remove_column :relationships, :updated_at
    remove_column :relationships, :created_at
    remove_column :relationships, :followed_id
    remove_column :relationships, :follower_id

    drop_table :relationships
  end
end
