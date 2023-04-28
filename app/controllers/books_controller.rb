class BooksController < ApplicationController
  
    
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to user_path(current_user)
  end


  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
    @users = User.all
  end

  def show
  end

  def edit
    @book = Book.find(params[:id])
  end
  
    private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
