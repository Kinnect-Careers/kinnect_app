# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  name: "Thanisha Pariage",
  email: "tp1590@nyu.edu",
  password: "Pass8or$",
  password_confirmation: "Pass8or$",
  admin: true
)

User.create!(
  name: "William Coit",
  email: "wc1672@nyu.edu",
  password: "Pass8or$",
  password_confirmation: "Pass8or$",
  admin: true
)

User.create!(
  name: "Ricardo Nunes",
  email: "sanunes.ricardo@gmail.com",
  password: "Pass8or$",
  password_confirmation: "Pass8or$",
  admin: true
)

100.times do |n|
  name = Faker::Name.name
  email = "user-#{n}@kinnectcareers.com"
  password = "Pass8or$"
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password
  )
end