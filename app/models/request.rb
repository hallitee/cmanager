class Request < ApplicationRecord
	belongs_to :room

	validates :title, :requestby, :email, :attendees, presence: true
		validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
end
