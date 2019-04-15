class InterestsController < ApplicationController

# チェックリスト登録
	def create
		event = Event.find(params[:event_id])
		interest = Interest.new
		interest.user_id = current_user.id
		interest.event_id = event.id
		if interest.save
			flash[:notice] = "クリップボードに追加しました"
			redirect_back(fallback_location: request.referer)
		else
			puts "失敗"
		end
	end

# チェックリストから外す
	def destroy
		event = Event.find(params[:event_id])
		interest = Interest.find_by(user_id: current_user.id, event_id: event.id)
		if interest.destroy
			flash[:notice] = "クリップボードから削除しました"
			redirect_back(fallback_location: request.referer)
		else
			puts "失敗"
		end
	end
end
