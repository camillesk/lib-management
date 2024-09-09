require "test_helper"

class BookBorrowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book_borrow = book_borrows(:one)
  end

  test "should get index" do
    get book_borrows_url
    assert_response :success
  end

  test "should get new" do
    get new_book_borrow_url
    assert_response :success
  end

  test "should create book_borrow" do
    assert_difference("BookBorrow.count") do
      post book_borrows_url, params: { book_borrow: { book_id: @book_borrow.book_id, due_date: @book_borrow.due_date, returned: @book_borrow.returned } }
    end

    assert_redirected_to book_borrow_url(BookBorrow.last)
  end

  test "should show book_borrow" do
    get book_borrow_url(@book_borrow)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_borrow_url(@book_borrow)
    assert_response :success
  end

  test "should update book_borrow" do
    patch book_borrow_url(@book_borrow), params: { book_borrow: { book_id: @book_borrow.book_id, due_date: @book_borrow.due_date, returned: @book_borrow.returned } }
    assert_redirected_to book_borrow_url(@book_borrow)
  end

  test "should destroy book_borrow" do
    assert_difference("BookBorrow.count", -1) do
      delete book_borrow_url(@book_borrow)
    end

    assert_redirected_to book_borrows_url
  end
end
