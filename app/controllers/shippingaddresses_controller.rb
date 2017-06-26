class ShippingaddressesController < ApplicationController
  def shipping
    @shippingaddress = Shippingaddress.new
  end

  def create
    @shippingaddress = current_user.shippingaddresses.new(shippingaddress_params)
    if @shippingaddress.save
      redirect_to checkout_billing_path
    else
      render 'shipping'
    end
  end

  private
  def shippingaddress_params
    params.require(:shippingaddress).permit(:address)
  end
end