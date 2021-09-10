class Public::OrdersController < ApplicationController
  def comfirm
  end
  
  def thanks
  end
  
  def index
    @order = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
  end
  
  def new
    @order = Order.new
  
  def create
    @order = Order.new(params[:id])
    if @order.save
    else
      render "new"
    end
  end
  
  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :order_status, :postage, :total_payment, :pay_type)
  end
end
