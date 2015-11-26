# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Carlos",
             email: "carlos@carlos.com",
             password:              "carlos",
             password_confirmation: "carlos",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)
             

User.create!(name:  "Qwerty",
             email: "qwerty@qwerty.com",
             password:              "qwerty",
             password_confirmation: "qwerty",
             activated: true,
             activated_at: Time.zone.now)             