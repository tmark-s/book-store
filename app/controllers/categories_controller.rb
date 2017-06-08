class CategoriesController < ApplicationController
	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(article_params)
		@category.save
		redirect_to categories_path
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		@category.update(article_params)
		redirect_to category_path(@category)
	end

	def show
		@category = Category.find(params[:id])
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to categories_path
	end

	private
	def article_params
		params.require(:category).permit(:categoryname)
	end
end