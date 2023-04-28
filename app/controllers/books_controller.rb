class BooksController < ApplicationController
  
    
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(params[:id])
  end


  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
    @users = User.all
  end

  def show
    @book = Book.new
    @user = current_user
    @books = Book.find(params[:id])
    @users = User.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book.id)
    redirect_to book_path(@book.id)
  end
    
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  
    private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
