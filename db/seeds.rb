# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Message.destroy_all
User.destroy_all
Channel.destroy_all

puts "All Messages, Users, and Channels have been destroyed, Creating Channels"

user_names = ['Jack', 'Jill']
channel_names = ['USA', 'react', 'general']



channels = channel_names.map do |name|
  Channel.find_or_create_by( name: name)
end


puts "Channels Seeded, Creating Users"

users = user_names.map do |name|
  User.create(email: "#{name}@gmail.com", password: "123456")
end

puts "Users Seeded, Creating Messages"

20.times do
  Message.create! user: users.sample, channel: channels.sample, content: Faker::TvShows::BojackHorseman.quote
end

puts "DATABASE SEEDED"

puts 'Channels:'
channels.each do |channel|
  puts "- #{channel.id}: #{channel.name}"
end
