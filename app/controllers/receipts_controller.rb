class ReceiptsController < ApplicationController
  def index
    
  end

  def view
    @receipt = Receipt.find(params[:id])
  end
end