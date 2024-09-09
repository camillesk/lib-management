class MemberDashboardController < ApplicationController
  before_action :set_stats
  before_action :authenticate_user!

  def set_stats
    @borrowed_books = BookBorrow.where(user_id: current_user.id)
    @overdue_books = BookBorrow.overdue_books_by_user(current_user.id)
  end
end
