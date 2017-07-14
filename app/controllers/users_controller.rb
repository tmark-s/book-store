class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :require_same_user, only: [:show]

  def index
    if user_signed_in? && current_user.admin?
      @users = User.all
    else
      flash[:danger] = "You cannot access this section"
      redirect_to root_path
    end
  end

  def show

  end

  private 
  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:danger] = "You can only edit your account"
      redirect_to root_path
    end
  end
end