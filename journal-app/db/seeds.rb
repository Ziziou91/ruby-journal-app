require 'faker'

# Clear existing data
puts "Clearing existing data..."
Entry.destroy_all
User.destroy_all

# Seed a known user for testing
puts "Seeding a test user..."
User.create!(
  email: "testuser@example.com",
  password: "testpassword",
  password_confirmation: "testpassword",
  first_name: "Test",
  last_name: "User",
  confirmed_at: Time.now
)

# Seed Users
puts "Seeding users..."
10.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: "password123",
    password_confirmation: "password123",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    confirmed_at: Faker::Time.between(from: 30.days.ago, to: Time.now)
  )
end

# Seed Entries
puts "Seeding entries..."
60.times do
  Entry.create!(
    name: Faker::Lorem.sentence(word_count: 3),
    link: Faker::Internet.url,
    created_at: Faker::Time.between(from: 30.days.ago, to: Time.now),
    updated_at: Faker::Time.between(from: 30.days.ago, to: Time.now)
  )
end

puts "Seeding complete!"
