class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def new
  end

  def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice]= "You have created book successfully."
    else
    @books = Book.all
    render :index
    @user = current_user
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @newbook = Book.new
    @user = User.find_by(id: @book.user_id)
  end

  def destroy
    book=Book.find(params[:id])
    book.destory
    redirect_to books_path
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice]= "You have update book successfully."
    redirect_to book_path(@book.id)
    else
    render :edit
    end
  end

 private

 def book_params
 params.require(:book).permit(:title, :body)
 end

 def is_matching_login_user
    user_id = Book.find(params[:id]).user_id
    unless user_id == current_user.id
      redirect_to books_path
    end
 end

end
