class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  	@book = Book.new
  	@users = User.all
  end

  def show
  	@book = Book.new
  	@user = User.find(params[:id])
  	@books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to books_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
