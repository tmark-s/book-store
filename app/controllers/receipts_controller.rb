class ReceiptsController < ApplicationController
  def index
    
  end

  def show
    @receipt = Receipt.find(params[:id])
  end
end