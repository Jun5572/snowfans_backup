class NotificationsController < ApplicationController

	layout 'main'

	def index
		@notifications = current_user.notifications
	end

	def link_through
		@notification = Notification.find(params[:id])
		@notification.update(check: true)
		if @notification.notification_type == "コメント" || @notification.notification_type == "参加"
			redirect_to user_event_path(current_user.id, @notification.event_id)
		elsif @notification.notification_type == "#{@notification.user.area.name}"
			redirect_to narrow_down_events_path
		end
	end
end
