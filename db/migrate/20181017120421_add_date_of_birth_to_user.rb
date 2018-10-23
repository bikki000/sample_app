class AddDateOfBirthToUser < ActiveRecord::Migration
  def up
  	add_column :users, :date_of_birth, :date, default: Date.today - 18.year
  end

  def down
  	change_column_default :users, :date_of_birth, nil
  	remove_column :users, :date_of_birth
  end

end
