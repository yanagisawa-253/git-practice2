class Public::AddressesController < ApplicationController
  
  def index
    @addresses = Address.all
    @address = Address.new
  end
  
  def create
    @address = Address.new(params[:id])
    if @address.save
      redirect_to public_addresses_path
    else
      @addresses = Address.all
      render 'index'
    end
  end
  
  def edit
    @address =Address.find(params[:id])
  end
  
  def update
    @address =Address.find(params[:id])
    if @address.update
      redirect_to public_addresses_path
    else
      @addresses = Address.all
      render 'index'
    end
  end
  
  def destroy
    @address =Address.find(params[:id])
  end
  
  private
  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end
end
