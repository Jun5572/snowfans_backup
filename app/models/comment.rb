class Comment < ApplicationRecord
	has_many :notifications

	belongs_to :user
	belongs_to :event

	validates :body, presence: true
	validates :user_id, presence: true
end
