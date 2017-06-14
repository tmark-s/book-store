class ShoppingcartsController < ApplicationController
  def create
    @book = Book.find(params[:id])
    @shoppingcart = current_user.shoppingcarts.new
    @shoppingcart.book = @book
    if @shoppingcart.save
      flash[:success] = "You add '#{@book.title}' to the shopping-cart"
      redirect_to books_path
    end
  end

  def show

  end

  def destroy
    @shoppingcart = Shoppingcart.find(params[:id])
    @shoppingcart.destroy
    redirect_to shoppingcarts_path
  end

  def checkout
    current_user.shoppingcarts.each do |shoppingcart|
      shoppingcart.destroy
    end
    redirect_to shoppingcarts_path
  end
end