class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end
	
	def create
		@user = User.new(article_params)
		if @user.save
			flash[:success] = "User was created"
			redirect_to users_path
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(article_params)
			flash[:success] = "User was updated"
			redirect_to users_path
		else
			render 'edit'
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		flash[:danger] = "User was deleted"
		redirect_to users_path
	end

	private 
	def article_params
		params.require(:user).permit(:firstname, :lastname, :dateofbirth, :address, :image, :email)
	end

end