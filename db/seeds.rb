# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all

@user1 = User.create!(name: 'Jim Bob', email: 'Jbob@somewhere.com')
@user2 = User.create!(name: 'Tim Timson', email: 'Ttimmer@hotmail.com')
@user3 = User.create!(name: 'Google Guy', email: 'Google@gmail.com')