class CommentsController < ApplicationController
	after_action :create_notification, only: [:create]

# コメント投稿
	def create
		comment = Comment.new(comment_params)
		@event = Event.find(params[:event_id])
		comment.user_id = current_user.id
		comment.send_by_id = @event.user_id
		comment.event_id = @event.id
		comment.save
		redirect_to user_event_path(@event.user_id, comment.event_id)
	end

# コメント削除
	def destroy
		comment = Comment.find(params[:id])
		comment.destroy
		redirect_to user_event_path(comment.send_by_id, comment.event_id)
	end




	private


	def create_notification
		return if @event.user_id == current_user.id
			Notification.create(	user_id: @event.user_id,
									notice_user_id: current_user.id,
									event_id: @event.id,
									notification_type: "コメント"
				)
	end

	def comment_params
		params.require(:comment).permit(:body, :user_id, :event_id, :send_by_id)
	end
end
