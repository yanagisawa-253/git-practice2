class Public::OrdersController < ApplicationController
  def confirm
    @order = Order.find(params[:id])
  end
  
  def thanks
  end
  
  def index
    @order = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
    @order_items= @order.order_items
  end
  
  def new
    @order = Order.new
    @address = Address.new
    @addresses =current_customer.address
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
