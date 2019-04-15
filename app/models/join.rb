class Join < ApplicationRecord
	belongs_to :user
	belongs_to :event
	
	has_one :notification

	validates :user_id, presence: true
	validates :event_id, presence: true
end
