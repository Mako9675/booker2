class UsersController < ApplicationController
  
  def index
    @user = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user.image.attach(params[:user][:image]) if @user.image.blank?
    if @user.update(user_params)
      flash[:notice] = "success"
      redirect_to user_path
    else
      render "edit", atatus: :unprocessable_entity
    end
  end
  
  private
  def user_params
    param.require(:book).permit(:name, :introduction, :image)
  end
end
