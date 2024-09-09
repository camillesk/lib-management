class Book < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_book,
                  against: %i[title author genre isbn],
                  using: {
                    tsearch: { prefix: true }
                  }
end
