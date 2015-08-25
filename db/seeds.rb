# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do
  name       = Faker::Name.first_name + " " + Faker::Name.last_name
  email      = name.gsub(' ', '.').downcase + "@support.com"
  department = %w(Sales Marketing Technical).sample
  message    = Faker::Lorem.paragraph
  done       = 0
  Request.create({name:       name,
                  email:      email,
                  department: department,
                  message:    message,
                  done:       done})
end
