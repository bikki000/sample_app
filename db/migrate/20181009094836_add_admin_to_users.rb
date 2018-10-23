class AddAdminToUsers < ActiveRecord::Migration
  def up
    add_column :users, :admin, :boolean, default: false
  end

  def down
  	change_column_default :users, :admin, nil
  	remove_column :users, :admin
  end
end
