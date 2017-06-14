class WishlistsController < ApplicationController
  def create
    @book = Book.find(params[:id])
    @wishlist = current_user.wishlists.new
    @wishlist.book = @book
    if current_user.wishlists.count < 10
      @wishlist.save
      redirect_to books_path
    else
      flash[:danger] = "You cannot add to wishlist more than 10"
      redirect_to books_path
    end
  end

  def show
    
  end

  def destroy
    @wishlist = Wishlist.find(params[:id])
    @wishlist.destroy
    redirect_to wishlists_path
  end

end