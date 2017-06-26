class CheckoutsController < ApplicationController
  def create
    if current_user.checkouts.count != 0
      current_user.checkouts.each do |checkout|
        @checkout = checkout
        @checkout.destroy
      end
      current_user.shoppingcarts.each do |shoppingcart|
        @checkout = current_user.checkouts.new
        @checkout.book = shoppingcart.book
        @checkout.save
      end
      redirect_to checkout_shipping_path
    else
      current_user.shoppingcarts.each do |shoppingcart|
        @checkout = current_user.checkouts.new
        @checkout.book = shoppingcart.book
        @checkout.save
      end
      redirect_to checkout_shipping_path
    end
  end

  def billing
    current_user.checkouts.each do |checkout|
      checkout.address = current_user.shippingaddresses.first.address
      checkout.save
    end
    shipping = current_user.shippingaddresses.first
    shipping.destroy
    redirect_to checkout_payment_path
  end

  def payment

  end

  def summary

  end
end