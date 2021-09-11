class Public::AddressesController < ApplicationController
  
  def index
    @addresses = Address.all
    @address = Address.new
  end
  
  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to public_addresses_path
    else
      @addresses = Address.all
      flash[:notice] = "not"
      render 'index'
    end
  end
  
  def edit
    @address =Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to public_addresses_path
    else
      @addresses = Address.all
      render 'index'
    end
  end
  
  def destroy
    @address =Address.find(params[:id])
    @address.destroy
    flash[:notice] = "配送先が削除されました"
    redirect_to public_addresses_path
  end
  
  private
  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end
end
