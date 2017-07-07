class OrdersController < ApplicationController
  def buy
    orderid = Array.new
    current_user.checkouts.each do |checkout|
      if checkout.address == ""
        checkout.destroy
      else
        orderid.push(checkout.id)
      end
    end
    userid =current_user.id
    HardWorker.perform_async(orderid, userid)
    current_user.checkouts.each do |checkout|
      if checkout.address == ""
        checkout.destroy
      else
        order = current_user.orders.new
        order.book = checkout.book
        order.address = checkout.address
        order.save
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