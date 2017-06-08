class BooksController < ApplicationController
	def index
		@books = Book.all
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(article_params)
		if @book.save
			flash[:success] = "Book was created"
			redirect_to books_path
		else
			render 'new'
		end
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(article_params)
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
		@book = Book.find(params[:id])
		@book.destroy
		flash[:danger] = "Book was deleted"
		redirect_to books_path
	end

	private
	def article_params
		params.require(:book).permit(:title, :author, :price, :description, :category_id, :image)
	end
end