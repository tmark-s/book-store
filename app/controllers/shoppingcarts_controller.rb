class ShoppingcartsController < ApplicationController
  def create
    @book = Book.find(params[:id])
    @shoppingcart = current_user.shoppingcarts.new
    @shoppingcart.book = @book
    if @shoppingcart.save
      flash[:success] = "You add '#{@book.title}' to the shopping-cart"
      redirect_to(:back)
    end
  end

  def show
    @user = current_user
  end

  def destroy
    current_user.shoppingcarts.each do |shoppingcart|
      shoppingcart.destroy
    end
    redirect_to shoppingcarts_path
  end
end