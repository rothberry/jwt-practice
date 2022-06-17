# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Deleting DB..."
User.delete_all

puts "Seeding Users..."
User.create(username: "benl", password: "123", bio: "nothing special")
User.create(username: "kale", password: "123", bio: "everything special")

puts "DONE!"
