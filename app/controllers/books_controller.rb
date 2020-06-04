class BooksController < ApplicationController
  def new
  	@book = Book.new
  end

  def index
  	@book = Book.new
  	@books = Book.all
  end

  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
  	if @book.save
  	flash[:notice] = "Book was successfully created"
    redirect_to books_path(@book)
    else
    @books = Book.all
    render action: :index
    end
  end

  def show
    @newbook = Book.new
  	@book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
