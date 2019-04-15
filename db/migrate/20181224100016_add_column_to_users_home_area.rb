class AddColumnToUsersHomeArea < ActiveRecord::Migration[5.2]
  def change
  	add_reference :users, :home_area, index: true
  end
end
