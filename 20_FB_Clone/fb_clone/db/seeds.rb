# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(
  name: 'M',
  last_name: 'Ashraf',
  email: 'ee.mashraf@gmail.com',
  password: '123456',
  password_confirmation: '123456'
)

50.times do |n|
  name = Faker::Name.name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email
  password = Faker::Internet.password
  User.create!(
    name: name,
    last_name: last_name,
    email: email,
    password: password,
    password_confirmation: password
  )
end

users = User.order(:created_at).take(10)

50.times do |n|
  body = Faker::Lorem.sentence(5)
  users.each { |user| user.posts.create!(body: body) }
end
