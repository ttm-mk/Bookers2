class BooksController < ApplicationController


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "The book was created successfully."
      redirect_to book_path(@book.id)
    else
     @user = current_user
     @books = Book.all
     @users = User.all
     
      render :index   
    end
  end


  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
    @users = User.all
  end

  def show
    @book = Book.new
    @bookdetail = Book.find(params[:id])
    @user = @bookdetail.user
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
       render :edit
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "The book was updated successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end


  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


    private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
