require "application_system_test_case"

class BookBorrowsTest < ApplicationSystemTestCase
  setup do
    @book_borrow = book_borrows(:one)
  end

  test "visiting the index" do
    visit book_borrows_url
    assert_selector "h1", text: "Book borrows"
  end

  test "should create book borrow" do
    visit book_borrows_url
    click_on "New book borrow"

    fill_in "Book", with: @book_borrow.book_id
    fill_in "Due date", with: @book_borrow.due_date
    check "Returned" if @book_borrow.returned
    click_on "Create Book borrow"

    assert_text "Book borrow was successfully created"
    click_on "Back"
  end

  test "should update Book borrow" do
    visit book_borrow_url(@book_borrow)
    click_on "Edit this book borrow", match: :first

    fill_in "Book", with: @book_borrow.book_id
    fill_in "Due date", with: @book_borrow.due_date
    check "Returned" if @book_borrow.returned
    click_on "Update Book borrow"

    assert_text "Book borrow was successfully updated"
    click_on "Back"
  end

  test "should destroy Book borrow" do
    visit book_borrow_url(@book_borrow)
    click_on "Destroy this book borrow", match: :first

    assert_text "Book borrow was successfully destroyed"
  end
end
