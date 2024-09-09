class LibrarianDashboardController < ApplicationController
  before_action :set_stats
  before_action :authenticate_user!
  def index; end

  def set_stats
    @total_books_count = Book.all.count
    @total_books = Book.all
    @borrowed_books = BookBorrow.all
    @borrowed_books_count = BookBorrow.all.count
    @overdue_books = BookBorrow.overdue_books
    @due_today_books = BookBorrow.due_today_books
  end
end
