class CreateBookBorrows < ActiveRecord::Migration[7.0]
  def change
    create_table :book_borrows do |t|
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :due_date
      t.boolean :returned, default: false

      t.timestamps
    end
  end
end
