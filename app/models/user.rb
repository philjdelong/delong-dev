class User < ApplicationRecord
	validates :email, uniqueness: true
	validates_presence_of :username, :email, :password, :password_confirmation, :role
	before_validation :generate_slug, only: :create
	
	validates :slug, presence: true

	has_secure_password
	enum role: %w(default admin)

	def generate_slug
		self.slug = username.to_s.downcase.parameterize.tr("_", "") + "-" + rand(100_000).to_s(26)
	end
end