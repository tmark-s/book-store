class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    if !logged_in? || !current_user.admin?
      flash[:danger] = "You cannot create new book"
      redirect_to books_path
    else
      @book = Book.new
    end
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Book was created"
      redirect_to books_path
    else
      render 'new'
    end
  end

  def edit
    if !logged_in? || !current_user.admin?
      flash[:danger] = "You cannot edit this book"
      redirect_to books_path
    else
      @book = Book.find(params[:id])
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "Book was updated"
      redirect_to books_path
    else
      render 'edit'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    if !logged_in? || !current_user.admin?
      flash[:danger] = "You cannot delete this book"
      redirect_to books_path
    else
      @book = Book.find(params[:id])
      @book.destroy
      flash[:danger] = "Book was deleted"
      redirect_to books_path
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :price, :description, :category_id, :image)
  end
end