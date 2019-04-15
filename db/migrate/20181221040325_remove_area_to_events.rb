class RemoveAreaToEvents < ActiveRecord::Migration[5.2]
  def change
  	remove_column :events, :area, :string
  end
end
