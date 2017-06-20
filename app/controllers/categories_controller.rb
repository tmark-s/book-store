class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    if !logged_in? || !current_user.admin?
      flash[:danger] = "You cannot create new category"
      redirect_to categories_path
    else
      @category = Category.new
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category was created"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit
    if !logged_in? || !current_user.admin?
      flash[:danger] = "You cannot edit this category"
      redirect_to categories_path
    else
      @category = Category.find(params[:id])
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "Category was updated"
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:danger] = "Category was deleted"
    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:categoryname)
  end
end 