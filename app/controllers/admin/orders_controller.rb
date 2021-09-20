class Admin::OrdersController < ApplicationController
  
  def index
    @orders = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_item.all
    @total = @order.inject(0) { |sum, item| sum + item.sum_of_price }
  end
  
  def update
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    if order.update(order_params)
      redirect_to admin_orders_path
    else
      render 'edit'
    end
  end
  
  private
  def order_params
    params.require(:order).permit(:customers_id, :postal_code, :address, :name, :order_status, :postage, :total_payment, :pay_type)
  end
end
