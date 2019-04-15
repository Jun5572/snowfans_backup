class Admins::UsersController < ApplicationController

	layout 'admin'

  def index
  	@page = "all_users"
  	@title = "登録ユーザー一覧"

  end

  def show
  	@page = "show_user"
  	@title = "ユーザー詳細"
  end
end
