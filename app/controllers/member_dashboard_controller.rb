class MemberDashboardController < ApplicationController
  before_action :set_stats
  before_action :authenticate_user!

  def set_stats
    @pagy_borrowed_books, @borrowed_books = pagy(BookBorrow.where(user_id: current_user.id))
    @pagy_due_today_books, @due_today_books = pagy(BookBorrow.due_today_books_by_user(current_user.id))
    @pagy_overdue_books, @overdue_books = pagy(BookBorrow.overdue_books_by_user(current_user.id))
  end
end
