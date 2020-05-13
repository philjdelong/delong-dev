class User < ApplicationRecord
	validates :username, uniqueness: true
	validates :email, uniqueness: true
	validates_presence_of :username, :email, :password

	has_secure_password
end