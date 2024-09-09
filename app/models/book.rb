class Book < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_book,
                  against: %i[title author genre isbn],
                  using: {
                    tsearch: { prefix: true }
                  }

  # relationships
  has_many :book_borrows

  def self.can_be_borrowed?
    total_copies > BookBorrow.where(book_id: id).count
  end
end
