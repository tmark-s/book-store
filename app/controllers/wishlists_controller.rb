class WishlistsController < ApplicationController
  def create
    @book = Book.find(params[:id])
    @wishlist = current_user.wishlists.new
    @wishlist.book = @book
    if current_user.wishlists.count < 10
      @wishlist.save
      redirect_to(:back)
    else
      flash[:danger] = "You cannot add to wishlist more than 10"
      redirect_to(:back)
    end
  end

  def show
    @user = current_user
  end

  def destroy
    @wishlist = Wishlist.find(params[:id])
    @wishlist.destroy
    redirect_to wishlists_path
  end

end