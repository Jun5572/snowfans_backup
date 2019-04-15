class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.date :date, null: false
      t.integer :user_id, null: false
      t.text :url

      t.timestamps
    end
  end
end
