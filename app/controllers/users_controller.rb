class UsersController < ApplicationController
  before_action :ensure_user, only: [:create, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  def index
    @user = User.all.page(params[:page])
    @book = Book.new
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to @book
    else
      render :index, status: :unprocessable_entity
    end
    
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  def ensure_user
    @users = current_user.id
    @user = User.find_by(id: params[:id])
    redirect_to user_path unless @user
  end
end
