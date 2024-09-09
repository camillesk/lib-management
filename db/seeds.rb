# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

librarian = User.create!(name: 'Librarian', email: 'librarian@mail.com', password: 'lib@123')
librarian.add_role :librarian

member = User.create!(name: 'Member', email: 'member@mail.com', password: 'member@123')
member.add_role :member
