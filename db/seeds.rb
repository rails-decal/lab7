# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

%w(Bulbasaur Charmander Squirtle Abra Magikarp).each do |name|
  Pokemon.create name: name, level: rand(2..50), description: 'A pokemon!', user_id: 1
end

%w(Ash Gary Misty Brock).each do |name|
  User.create name: name, num_badges: rand(0..8)
end
