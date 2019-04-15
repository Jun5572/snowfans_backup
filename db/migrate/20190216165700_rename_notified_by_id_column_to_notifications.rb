class RenameNotifiedByIdColumnToNotifications < ActiveRecord::Migration[5.2]
  def change
  	rename_column :notifications, :notified_by_id, :notice_user_id
  end
end
