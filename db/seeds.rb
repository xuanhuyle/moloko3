# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'
# Clear existing data
Job.destroy_all
User.destroy_all

# Create some sample users (customers and lawyers)
customer1 = User.create!(email: "customer1@example.com", password: "password", role: "customer")
customer2 = User.create!(email: "customer2@example.com", password: "password", role: "customer")

lawyer1 = User.create!(email: "lawyer1@example.com", password: "password", role: "lawyer")
lawyer2 = User.create!(email: "lawyer2@example.com", password: "password", role: "lawyer")

# Create sample jobs
Job.create!(
  title: "Corporate Law Consultation",
  description: "Need a lawyer to provide corporate law advice.",
  location: "Paris",
  expertise: "Corporate Law",
  timeline: Date.today + 10,
  user: customer1
)

Job.create!(
  title: "Real Estate Dispute",
  description: "Looking for legal representation in a real estate dispute.",
  location: "New York",
  expertise: "Real Estate Law",
  timeline: Date.today + 5,
  user: customer2
)

puts "Database seeded with sample users and jobs!"
