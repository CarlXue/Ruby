# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

## Create a dummy user
user = User.create!(first_name: "Mat", last_name: "Blair", password: "testtest", password_confirmation:"testtest",
	email: "mathew.blair@unimelb.edu.au", bio: "Some really awesome author that wrote some stuff",
	username: 'mjolkchoklad')

