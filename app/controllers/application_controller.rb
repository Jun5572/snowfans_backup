class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :authenticate_user!
	before_action :request_path
	# before_action :configure_permitted_parameters,if: :devise_controller?

	def after_sign_in_path_for(resouece)
		root_path(current_user)
	end

	def after_sign_out_path_for(resouece)
		new_user_session_path
	end

	def request_path
		@path = controller_path + '#' + action_name
		def @path.is(*str)
			str.map{|s| self.include?(s)}.include?(true)
		end
	end


	def correct_user?
		user = User.where(id: params[:id]).exists? && User.find(params[:id])
		if user
			unless user == current_user
				flash[:error] = "他のユーザー情報は変更できません！"
				redirect_back(fallback_location: root_path)
			end
		else
			flash[:error] = "ユーザーが存在しません！"
			redirect_back(fallback_location: root_path)
		end
	end

	protected
end
