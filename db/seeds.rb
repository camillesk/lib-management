# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

librarian = User.create(name: 'Librarian', email: 'librarian@mail.com', password: 'lib@123')
librarian.add_role :librarian

member1 = User.create(name: 'Member1', email: 'member1@mail.com', password: 'member1@123')
member1.add_role :member

member2 = User.create(name: 'Member2', email: 'member2@mail.com', password: 'member2@123')
member2.add_role :member

10.times do
  Book.create(title: Faker::Book.title, author: Faker::Book.author, genre: Faker::Book.genre, isbn: rand(99_999_999),
              total_copies: rand(30))
end

bb1 = BookBorrow.create(user_id: member1.id, book_id: rand(1..10))

bb1.update(due_date: Date.today)

bb2 = BookBorrow.create(user_id: member2.id, book_id: rand(1..10))

bb2.update(due_date: Date.today - 3.days)
