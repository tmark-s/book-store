class OrdersController < ApplicationController
  def buy
    Order.print_receipt current_user.checkouts, current_user
    current_user.checkouts.each do |checkout|
      if checkout.address == ""
        checkout.destroy
      else
        order = current_user.orders.new
        order.book = checkout.book
        order.address = checkout.address
        order.save
        checkout.destroy
      end
    end
    current_user.shoppingcarts.each do |shoppingcart|
      shoppingcart.destroy
    end
    Order.freq_buy current_user
    Order.buy_count
    redirect_to shoppingcarts_path
    flash[:success] = "Success!"
  end

  def show

  end
end