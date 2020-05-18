class User < ApplicationRecord
	validates :email, uniqueness: true
	validates :slug, uniqueness: true
	validates_presence_of :username, :email, :password, :password_confirmation, :role

	
	has_secure_password
	enum role: %w(default admin)
	
	after_validation :generate_slug, only: [:create, :update]

	private

	def generate_slug
		self.slug = username.downcase.parameterize.tr("_", "") + "-" + rand(100_000).to_s(26)
	end
end