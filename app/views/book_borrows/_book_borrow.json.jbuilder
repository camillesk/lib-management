json.extract! book_borrow, :id, :book_id, :due_date, :returned, :created_at, :updated_at
json.url book_borrow_url(book_borrow, format: :json)
