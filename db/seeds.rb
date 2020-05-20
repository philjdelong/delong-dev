# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
	username: "Default",
	email: "email@default.com",
	password: "password",
	password_confirmation: "password"
)

admin = User.find_by(email: ENV['admin_email'])

if admin
	User.delete(admin)
end

User.create(
	username: ENV['admin_username'],
	email: ENV['admin_email'],
	password: ENV['admin_password'],
	password_confirmation: ENV['admin_password'],
	role: ENV['admin_role']
)