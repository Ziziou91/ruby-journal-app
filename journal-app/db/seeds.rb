require 'faker'

# Clear existing data
puts "Clearing existing data..."
Entry.destroy_all
User.destroy_all

# Seed known users for testing
puts "Seeding test users..."
User.create!(
  email: "testuser@example.com",
  password: "testpassword",
  password_confirmation: "testpassword",
  first_name: "Test",
  last_name: "User",
  confirmed_at: Time.now
)

User.create!(
  email: "seconduser@example.com",
  password: "secondpassword",
  password_confirmation: "secondpassword",
  first_name: "Second",
  last_name: "User",
  confirmed_at: Time.now
)

# Seed additional users
puts "Seeding users..."
5.times do
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
    user: User.all.sample, # Randomly associate the entry with a user
    created_at: Faker::Time.between(from: 30.days.ago, to: Time.now),
    updated_at: Faker::Time.between(from: 30.days.ago, to: Time.now)
  )
end

# Seed Shared Entries
puts "Seeding shared entries..."
Entry.all.each do |entry|
  # Share each entry with 2 random users
  users_to_share = User.where.not(id: entry.user_id).sample(2)
  users_to_share.each do |user|
    SharedEntry.create!(user: user, entry: entry)
  end
end

puts "Seeding complete!"
