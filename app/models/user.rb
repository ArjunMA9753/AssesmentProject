class User < ApplicationRecord
	validates :name, presence: true
	validates :gender, presence: true
	validates :email, presence: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
end
