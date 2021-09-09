class Admin::OrderItemsController < ApplicationController
  
  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update
    redirect_to admin_order_path
  end
  
  private
  def order_item_params
    params.require(:order_item).permit(:item_id, :order_id, :making_status, :tax_price, :amount)
  end
end
