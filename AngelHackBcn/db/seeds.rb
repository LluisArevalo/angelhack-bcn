# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Users
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

#Priorities
priority = Priority.new
priority.level = "High"
priority.save

priority = Priority.new
priority.level = "Medium"
priority.save

priority = Priority.new
priority.level = "Low"
priority.save

#Regions

region = Region.new
region.ambit = "District"
region.area = "La Latina"
region.save

region = Region.new
region.ambit = "City"
region.area = "Madrid"
region.save

region = Region.new
region.ambit = "Country"
region.area = "Spain"
region.save

region = Region.new
region.ambit = "City"
region.area = "Barcelona"
region.save

region = Region.new
region.ambit = "District"
region.area = "Poble Nou"
region.save

#Topics

topic = Topic.new
topic.description = "Health"
topic.save

topic = Topic.new
topic.description = "Education"
topic.save

topic = Topic.new
topic.description = "Civil Rights"
topic.save

topic = Topic.new
topic.description = "Finance"
topic.save

#Initiative

initiative = Initiative.new
initiative.title = "Raise the minimum wage"
initiative.content = "If you work hard you should be compensated fairly. Rise minimum wage to $15 per hour"
initiative.save

initiative = Initiative.new
initiative.title = "Renewable energy"
initiative.content = "Invest in cleaner renewable energy and fund research and development"
initiative.save

initiative = Initiative.new
initiative.title = "Taxes initiatives"
initiative.content = "Raise taxes on high-income taxpayers, modify taxation of multinational corporations, repeal fossil fuel tax incentives, and increasing estate and gift taxes"
initiative.save


