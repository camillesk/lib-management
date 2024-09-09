class BookBorrow < ApplicationRecord
  # relationships
  belongs_to :book
  belongs_to :user

  # callbacks
  after_create :set_due_date
  validate :total_copies

  def self.overdue_books
    BookBorrow.where('due_date < ?', Date.today)
  end

  def self.overdue_books_by_user(user_id)
    BookBorrow.where('due_date < ?', Date.today).where(user_id:)
  end

  def self.due_today_books
    BookBorrow.where('due_date = ?', Date.today)
  end

  def set_due_date
    update(due_date: Date.today + 2.weeks)
  end

  def verify_total_copies
    book = Book.find(book_id)
    return if book.can_be_borrowed

    errors.add(:total_copies, 'no more books available')
  end
end
