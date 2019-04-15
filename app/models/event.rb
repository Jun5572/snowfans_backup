class Event < ApplicationRecord


	has_many :interests, dependent: :destroy
	has_many :joins, dependent: :destroy
	has_many :join_users, through: :joins, source: :user
	has_many :check_users, through: :interests, source: :user
	has_many :comments, dependent: :destroy
	has_many :notifications, dependent: :destroy

	belongs_to :user
	belongs_to :area


	validates :title, presence: true
	validates :description, presence: true
	validates :area_id, presence: true
	# validates :url, format: /\A#{URI::regexp(%w(http https))}\z/


	def join?(user)
		join_users.include?(user)
	end

	def checked?(user)
		check_users.include?(user)
	end

	def new_arrival?
		created_at + 1.week > Date.today
	end

end
