# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Created by Song Xue (667692)
# Engineering and IT school, University of Melbourne

## Create a dummy user
user = User.create!(first_name: "Carl", last_name: "Xue", password: "1234", password_confirmation:"1234",
	email: "test@unimelb.edu.au", bio: "Balabalabala",
	username: 'sxue1')

