class RenameImageUrlColumnToUsers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :image_url, :thumbnail_id
  end
end
