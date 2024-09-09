class LibrarianDashboardController < ApplicationController
  before_action :set_stats
  before_action :authenticate_user!
  before_action :verify_role
  def index; end

  def set_stats
    @total_books_count = Book.all.pluck(:total_copies).sum
    @borrowed_books_count = BookBorrow.where(returned: false).count
    @pagy_total_books, @total_books = pagy(Book.all)
    @pagy_borrowed_books, @borrowed_books = pagy(BookBorrow.where(returned: false))
    @pagy_overdue_books, @overdue_books = pagy(BookBorrow.overdue_books)
    @pagy_due_today_books, @due_today_books = pagy(BookBorrow.due_today_books)
  end
end
