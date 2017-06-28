class TagsController < ApplicationController
  def show
    if !logged_in? && !current_user.admin?
      flash[:danger] = "You cannot do this section"
      redirect_to root_path
    else
      @book = Book.find(params[:id])
    end
  end

  def delete
    if logged_in? && current_user.admin?
      @tagging = ActsAsTaggableOn::Tagging.find(params[:id])
      @tagging.destroy
      flash[:danger] = "Tag was deleted"
      redirect_to books_path
    else
      flash[:danger] = "You cannot do this section"
      redirect_to books_path
    end
  end
end