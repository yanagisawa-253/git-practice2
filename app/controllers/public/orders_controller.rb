class Public::OrdersController < ApplicationController
  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @adress.postal_code
    @order.address = @address.address
    @order.name = @address.name
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
    @address = Address.new
  end
  
  def create
    @address = Address.new(params[:order][:address_id])
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
