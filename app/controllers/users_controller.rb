class UsersController < ApplicationController
  before_action :ensure_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  
  def index
    @user = User.all
  end
  
  def show
    @user = User.find_by(id:current_user.id)
    @books = @user.books
  end
  
  

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(current_user.id)
  end
  
  private
  def user_params
    param.require(:book).permit(:name, :introduction, :image)
  end
  def ensure_user
    @users = current_user.users
    @user = @users.find_by(id: params[:id])
    redirect_to user_path unless @user
  end
end
