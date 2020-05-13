# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.find_by(email: ENV['admin_email'])

if admin
	admin.update(
		username: ENV['admin_username'], 
		email: ENV['admin_email'], 
		password: ENV['admin_password'],
		role: ENV['admin_role']
	)
else 
	admin.create(
		username: ENV['admin_username'], 
		email: ENV['admin_email'], 
		password: ENV['admin_password'],
		role: ENV['admin_role']
	)
end