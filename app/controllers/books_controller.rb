class BooksController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to books_path
    else
      @books = Book.all.page(params[:page])
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all.page(params[:page])
  end

  def show
    @books = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to book_path(@book.id)
    else
      render :show
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
    
  private
   def book_params
     params.require(:book).permit(:title, :body,)
   end
end
