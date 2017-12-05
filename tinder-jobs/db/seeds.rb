# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Resume.destroy_all

Sector.destroy_all
Employer.destroy_all
Opening.destroy_all

Application.destroy_all

jon = User.create(name: "Jon")
chris = User.create(name: "Chris")

jon.resume = Resume.create(title: "Jon's Resume", description: "I'm good at things")
chris.resume = Resume.create(title: "Chris's Resume", description: "I'm excellent at things")

5.times do |t|
  employer = Employer.create(name: Faker::Company.unique.name, sector: Sector.create(name: Faker::Job.unique.field))
  2.times do |t|
    opening = Opening.create(title: Faker::Job.unique.title, description: Faker::Company.unique.bs, salary: rand * 100000)
    Employer.all.sample.openings << opening
  end
end
