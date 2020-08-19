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
  admin: true,
  activated: true,
  activated_at: Time.zone.now
)

User.create!(
  name: "William Coit",
  email: "wc1672@nyu.edu",
  password: "Pass8or$",
  password_confirmation: "Pass8or$",
  admin: true,
  activated: true,
  activated_at: Time.zone.now
)

User.create!(
  name: "Ricardo Nunes",
  email: "sanunes.ricardo@gmail.com",
  password: "Pass8or$",
  password_confirmation: "Pass8or$",
  admin: true,
  activated: true,
  activated_at: Time.zone.now
)

50.times do |n|
  name = Faker::Name.name
  email = "user-#{n}@kinnectcareers.com"
  password = "Pass8or$"
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now
  )
end

users= User.order(:created_at).take(10)
10.times do |n|
  title = Faker::Lorem.sentence(word_count: 2)
  descriptor = Faker::Lorem.sentence(word_count: 20)
  company = Faker::Lorem.sentence(word_count: 3)
  roles = Faker::Lorem.sentence(word_count: 150)
  users.each do |user| 
    user.skills.create!(title: title, descriptor: descriptor) 
    user.experiences.create!(
      company: company, 
      started_at: (n+10).months.ago, 
      ended_at: (n+5).months.ago,
      roles: roles
    )
    company = Faker::Lorem.sentence(word_count: 3)
    roles = Faker::Lorem.sentence(word_count: 150)
    user.experiences.create!(
      company: company, 
      started_at: (n+4).months.ago, 
      roles: roles
    )
  end
end


