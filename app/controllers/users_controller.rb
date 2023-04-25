class UsersController < ApplicationController
  
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = Book.all
  end




  def edit
    @user = User.find(params[:id])
  end
  
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

  
end


