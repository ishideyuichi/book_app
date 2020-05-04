class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  NUMBER_OF_ITEMS = 5

  # GET /books
  # GET /books.json
  def index
    @books = Book.page(params[:page]).per(NUMBER_OF_ITEMS)
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book, notice: t('Book was successfully created')
    else
      frender :new
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      redirect_to @book, notice: t('Book was successfully updated').to_s
    else
      render :edit
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
    redirect_to books_url, notice: t('Book was successfully destroyed').to_s
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :memo, :author, :picture)
    end
end
