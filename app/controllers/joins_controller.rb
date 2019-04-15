class JoinsController < ApplicationController

	after_action :create_notification, only: [:create]


	# 参加するボタンを押した時
	def create
		@event = Event.find(params[:event_id])
		join = Join.new
		join.user_id = current_user.id
		join.event_id = @event.id
		if join.save
			flash[:notice] = "イベント参加が確定しました"
			redirect_back(fallback_location: request.referer)
		else
			puts "失敗"
		end
	end

# 参加辞退
	def destroy
		event = Event.find(params[:event_id])
		join = Join.find_by(event_id: event.id)
		if join.destroy
			flash[:notice] = "イベント参加を取り消しました"
			redirect_back(fallback_location: request.referer)
		else
			puts "失敗"
		end
	end


	private


	def create_notification
		Notification.create(user_id: @event.user_id,
							event_id: @event.id,
							notice_user_id: current_user.id,
							notification_type: "参加"
		)
	end


end
