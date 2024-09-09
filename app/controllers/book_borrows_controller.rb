class BookBorrowsController < ApplicationController
  before_action :set_book_borrow, only: %i[show edit update destroy return_book]
  before_action :authenticate_user!
  before_action :verify_role, only: %i[return_book]

  # GET /book_borrows or /book_borrows.json
  def index
    @book_borrows = BookBorrow.all
  end

  # GET /book_borrows/1 or /book_borrows/1.json
  def show
  end

  # GET /book_borrows/new
  def new
    @book_borrow = BookBorrow.new
  end

  # GET /book_borrows/1/edit
  def edit
  end

  # POST /book_borrows or /book_borrows.json
  def create
    BookBorrow.transaction do
      @book_borrow = BookBorrow.new(book_borrow_params)
    end

    respond_to do |format|
      if @book_borrow.save
        format.html { redirect_to books_path, notice: 'Book was succesfully borrowed' }
        format.json { render :show, status: :created, location: @book_borrow }
      else
        format.html { redirect_to books_path, status: :unprocessable_entity, notice: @book_borrow.errors.first.message }
        format.json { render json: @book_borrow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_borrows/1 or /book_borrows/1.json
  def update
    respond_to do |format|
      if @book_borrow.update(book_borrow_params)
        format.html { redirect_to book_borrow_url(@book_borrow), notice: 'Book borrow was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_borrow }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book_borrow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_borrows/1 or /book_borrows/1.json
  def destroy
    @book_borrow.destroy

    respond_to do |format|
      format.html { redirect_to book_borrows_url, notice: 'Book borrow was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def return_book
    respond_to do |format|
      if @book_borrow.update(returned: true)
        format.html { redirect_to librarian_dashboard_path, notice: 'Book borrow was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_borrow }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book_borrow.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book_borrow
    @book_borrow = BookBorrow.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def book_borrow_params
    params.require(:book_borrow).permit(:book_id, :user_id, :due_date, :returned)
  end
end
