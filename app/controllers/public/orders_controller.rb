class Public::OrdersController < ApplicationController
  
  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end
  
  def thanks
  end
  
  def index
    @order = Order.where(signed_in? :current_customer)
  end
  
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end
  
  def new
    @order = Order.new
    @address = Address.new
    @addresses = current_customer.addresses
  end
  
  def create
    @address = Address.new(params[:id])
    @addresses = current_customer.addresses
    @order = Order.new(order_params)
    if @order.save
      @cart_items =current_customer.cart_items.all
        @cart_items.each do |cart_item|
          @order_item = @order.order_items.new
          @order_item.item_id = cart_item.item.id
          @order_item.item_price = cart_item.price
          @order_item.order_id = @order.id
          
          @order.save
        end
      redirect_to public_order_comfirm_path(@order)
    else
      flash.now[:notice] = "正しく入力してください"
      render "new"
    end
  end
  
  private
  def order_params
    params.require(:order).permit(:customers_id, :postal_code, :address, :name, :order_status, :postage, :total_payment, :pay_type)
  end
end
