class Public::OrdersController < ApplicationController
  
  def comfirm
    @order = Order.new(order_params)
    params[:order][:pay_type] = params[:order][:pay_type].to_i
    
    @order.pay_type = session[:pay_type]
    @order.address = session[:full_address]
    
    if params[:order][:serlect_address] == "0"
      @order.postal_code =current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
      
    elsif params[:order][:serlect_address] == "1"
      @order.postal_code = Address.find(params[:order][:address]).postal_code
      @order.address = Address.find(params[:order][:address]).address
      @order.name = Address.find(params[:order][:address]).name
      
    elsif params[:order][:serlect_address] == "2"
      @address = Address.new()
      @address.address = params[:order][:address]
      @address.name = params[:order][:name]
      @address.postal_code = params[:order][:postal_code]
      @address.customers_id = current_customer.id
      if @address.save
        @order.postal_code = @address.postal_code
        @order.name = @address.name
        @order.address = @address.address
      else
        render 'new'
      end
    end
    
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end
  
  def thanks
  end
  
  def index
    @orders = current_customer.orders
  end
  
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @total = 0
  end
  
  def new
    @order = Order.new
    @address = Address.new
    @addresses = current_customer.addresses
    @customer = current_customer
  end
  
  def create
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
    @order.customers_id = current_customer.id
    @order.save
    
    cart_items = current_customer.cart_items.all
    cart_items.each do |cart_item|
      @order_item = OrderItem.new
      @order_item.order_id = @order.id
      @order_item.tax_price = cart.item.with_tax_price
      @order_item.amount = cart.amount
      @order_item.save
    end
    
    current_customer.cart_items.destroy_all #ループ終了時カートの中身を削除する
    redirect_to public_orders_thanks_path
  end
  
  private
  def order_params
    params.require(:order).permit(:customers_id, :postal_code, :address, :name, :order_status, :postage, :total_payment, :pay_type)
  end
  def address_params
    params.permit(:address, :name, :postal_code, :customers_id)
  end
end
