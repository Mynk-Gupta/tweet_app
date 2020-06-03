# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Organization
Organization.create(([{ name: 'ORG-1' }, { name: 'ORG-2' }]))

# Create Users
User.create(([
  { email: 'admin@test.com', password: 'password', is_admin: true  },
  { email: 'user_1@test.com', password: 'password', organization_id: 1 },
  { email: 'user_2@test.com', password: 'password', organization_id: 1 },
  { email: 'user_3@test.com', password: 'password', organization_id: 2 },
]))
