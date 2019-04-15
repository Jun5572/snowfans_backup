class Area < ApplicationRecord
	has_many :users
	has_many :events
end
