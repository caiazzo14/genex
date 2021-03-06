# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


Experience.destroy_all
puts "Destroyed all experiences"

User.destroy_all
puts "Destroyed all users"

LANGUAGES = ["English", "Portuguese", "French", "Spanish", "German"]
LEVEL = ["Bad", "Regular", "Good", "Very Good", "Excellent"]
SKILLS = ["Woodcraft", "Speech", "Cooking", "Football tactics"]

puts "Starting creation of base users"
user1 = User.new(
    email: "cirolas@lewagon.com",
    first_name: "Cirolas",
    last_name: Faker::Name.last_name,
    age: rand(18..90),
    location: Faker::Address.city,
    occupation: Faker::Job.title,
    civil_state: ["Married", "Single", "Widowed", "Divorced"].sample,
    password: "12345678"
    )
  user1.save!
puts "User Created"

user2 = User.new(
    email: "nicoliro@lewagon.com",
    first_name: "Nicoliro",
    last_name: Faker::Name.last_name,
    age: rand(18..90),
    location: Faker::Address.city,
    occupation: Faker::Job.title,
    civil_state: ["Married", "Single", "Widowed", "Divorced"].sample,
    password: "12345678"
    )
  user2.save!
puts "User Created"

puts "Creating 30 experiences"

30.times do
  experience = Experience.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    gender: Faker::Gender.binary_type,
    age: rand(65..90),
    location: Faker::Address.city,
    user: User.all.sample
    )
  experience.save!
  language = Language.new(experience_id: experience.id, name: LANGUAGES.sample, level: LEVEL.sample)
  language.save!
  skill = Skill.new(experience_id: experience.id, name: SKILLS.sample, level: LEVEL.sample, description: "veiote's ability")
  skill.save!
end

puts "30 experiences created successfully"
