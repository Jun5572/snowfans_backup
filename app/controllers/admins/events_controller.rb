class Admins::EventsController < ApplicationController

	layout 'admin'

  def index
  	@page = "all_events"
  	@title = "投稿一覧"
  end

  def show
  	@page = "show_event"
  	@title = "投稿詳細"
  end

  def new
  	@page = "new_event"
  	@title = "管理者投稿を作成"
  end
end
