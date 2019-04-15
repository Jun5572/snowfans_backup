class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :user, index: true, foreign_key: true
      t.references :notified_by, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true
      t.string :type
      t.boolean :check, default: false

      t.timestamps
    end
  add_foreign_key :notifications, :users, column: :notified_by_id
  end
end
