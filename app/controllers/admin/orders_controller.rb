class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
    if order.update(order_params)
      redirect_to orders_path
    else
      render 'edit'
    end
  end
  
  private
  def order_params
    params.require(:order).permit(:customers_id, :postal_code, :address, :name, :order_status, :postage, :total_payment, :pay_type)
  end
end
