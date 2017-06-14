class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :show, :destroy]
	before_action :require_same_user, only: [:edit, :update, :show, :destroy]

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Your account was created"
			redirect_to users_path
		else
			render 'new'
		end
	end

	def edit

	end

	def update
		if @user.update(user_params)
			flash[:success] = "Your profile was updated"
			redirect_to users_path
		else
			render 'edit'
		end
	end

	def show

	end

	def destroy
		@user.destroy
		flash[:danger] = "User was deleted"
		redirect_to users_path
	end

	private 
	def user_params
		params.require(:user).permit(:firstname, :lastname, :dateofbirth, :address, :image, :email, :password)
	end

	def set_user
		@user = User.find(params[:id])
	end

	def require_same_user
		if current_user != @user
			flash[:danger] = "You can only edit your account"
			redirect_to root_path
		end
	end

end