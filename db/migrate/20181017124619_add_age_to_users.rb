class AddAgeToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :age, :integer, default: Date.today - User.select("date_of_birth").first.date_of_birth
  end
end
