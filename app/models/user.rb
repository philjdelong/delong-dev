class User < ApplicationRecord
	validates :username, uniqueness: true
	validates :email, uniqueness: true
	validates_presence_of :username, :email, :password, :password_confirmation, :role

	has_secure_password
	enum role: %w(default admin)
end