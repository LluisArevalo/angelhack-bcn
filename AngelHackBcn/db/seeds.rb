# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.new
user.email = "paco@perez.com"
user.password = '1234567890'
user.save

user = User.new
user.email = "josefina@lopez.com"
user.password = '1234567890'
user.save

user = User.new
user.email = "sara@garcia.com"
user.password = '1234567890'
user.save

user = User.new
user.email = "marta@fonda.com"
user.password = '1234567890'
user.save

user = User.new
user.email = "lluis@albert.com"
user.password = '1234567890'
user.save

user = User.new
user.email = "raul@vega.com"
user.password = '1234567890'
user.save