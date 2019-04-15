class RenameHomeAreaIdColumnToUsers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :home_area_id, :area_id
  end
end
