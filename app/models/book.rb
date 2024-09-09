class Book < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_book,
                  against: %i[title author genre isbn],
                  using: {
                    tsearch: { prefix: true }
                  }

  # validations
  validates_presence_of %i[title author genre isbn total_copies]

  # relationships
  has_many :book_borrows

  def can_be_borrowed?
    total_copies > BookBorrow.where(book_id: id, returned: false).count
  end
end
