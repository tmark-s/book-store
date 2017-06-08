class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end
	
	def create
		@user = User.new(article_params)
		@user.save
		redirect_to user_path(@user)
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(article_params)
		redirect_to user_path(@user)
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path
	end

	private 
	def article_params
		params.require(:user).permit(:firstname, :lastname, :dateofbirth, :address)
	end

end