class AddColumnToEvents2 < ActiveRecord::Migration[5.2]
  def change
  	add_reference :events, :area, index: true
  end
end
