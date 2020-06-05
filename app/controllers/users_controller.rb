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
  end
end
