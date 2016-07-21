class BooksController < ApplicationController

  def new
    @book = Book.new
  
  end


  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "book created"
      redirect_to books_url
    else
      render 'new'
    end

  end

 def index
   @books = Book.all
 end

private
  def book_params
    params.require(:book).permit(:title, :author, :category, :isbn, :publisher)
  end


end
