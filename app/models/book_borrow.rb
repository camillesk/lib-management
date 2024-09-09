class BookBorrow < ApplicationRecord
  # relationships
  belongs_to :book
  belongs_to :user

  # callbacks
  after_create :set_due_date

  # validations
  validate :total_copies, on: :create
  validate :same_title, on: :create

  def self.overdue_books
    BookBorrow.where('due_date < ?', Date.today).where(returned: false)
  end

  def self.overdue_books_by_user(user_id)
    BookBorrow.where('due_date < ?', Date.today).where(user_id:, returned: false)
  end

  def self.due_today_books
    BookBorrow.where('due_date = ?', Date.today)
  end

  def self.due_today_books_by_user(user_id)
    BookBorrow.where('due_date = ?', Date.today).where(user_id:, returned: false)
  end

  def set_due_date
    update(due_date: Date.today + 2.weeks)
  end

  def total_copies
    book = Book.find(book_id)
    return if book.can_be_borrowed?

    errors.add(:total_copies, 'no more books available')
  end

  def same_title
    return unless BookBorrow.where(book_id:, user_id:).count >= 1

    errors.add(:same_title, 'you already booked this title!')
  end
end
