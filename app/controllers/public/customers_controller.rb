class Public::CustomersController < ApplicationController
  
  def show
    @customer =Customer.find(params[:id])
  end
  
  def edit
    @customer =Customer.find(params[:id])
  end
  
  def update
    @customer =Customer.find(params[:id])
    if @customer.update
      redirect_to public_customer_path(@customer.id)
    else
      render 'edit'
    end
  end
  
  def unsubscribe
    @customer =Customer.find(params[:id])params
  end
  
  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_active)
  end
end
