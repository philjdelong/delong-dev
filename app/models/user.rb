class User < ApplicationRecord
	validates :email, uniqueness: true
	validates_presence_of :username, :email, :role
	before_validation :get_slug
	validates :slug, uniqueness: true

	has_many :games

	has_secure_password
	enum role: %w(default admin)

	def get_slug
		self.slug || self.slug = username.to_s.downcase.parameterize.tr("_", "") + "-" + rand(100_000).to_s(26)
	end
end