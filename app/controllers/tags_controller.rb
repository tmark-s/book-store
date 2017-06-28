class TagsController < ApplicationController
  def show
    if !logged_in? && !current_user.admin?
      flash[:danger] = "You cannot do this section"
      redirect_to root_path
    else
      @book = Book.find(params[:id])
      @tag = ActsAsTaggableOn::Tag.new
    end
  end

  def addtag
    if logged_in? && current_user.admin?
      @tag = ActsAsTaggableOn::Tag.new(tag_params)
      @book = Book.find(params[:id])
      @book.tag_list.add(@tag)
      @book.save
      redirect_to tag_edit_path
    else
      flash[:danger] = "You cannot do this section"
      redirect_to books_path
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

  private
  def tag_params
    params.require(:acts_as_taggable_on_tag).permit(:name)
  end

end