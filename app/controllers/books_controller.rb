class BooksController < ApplicationController

  def new
    @book = Book.new
  
  end


  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Book Added"
      redirect_to books_url
    else
      render 'new'
    end

  end

 #showing all books
  def index
   @books = Book.all
  end


 def show
 @book = Book.find(params[:id])
 end

#Edits a book.
 def edit 
 @book = Book.find(params[:id])
 end

#Updates a book
 def update
 @book = Book.find(params[:id])
 if @book.update_attributes(book_params)
   flash[:success] = "Book Updated"
   redirect_to books_url
 else
   render 'edit'
 end
 end

#Deletes a book
 def destroy
 @book = Book.find(params[:id])
 @book.destroy
 flash[:success] = "Book is successfully deleted"
 redirect_to books_url
 end

#defined book params
private
  def book_params
    params.require(:book).permit(:title, :author, :category, :isbn, :publisher)
  end

end
