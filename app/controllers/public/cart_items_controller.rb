class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item.save
      flash[:notice] = "商品がカートに追加されました"
      redirect_to public_cart_items_path
    else
      flash.now[:notice] = "追加できませんでした"
      render 'index'
    end
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash[:notice] = "一件の商品が削除されました"
    redirect_to public_cart_items_path
  end
  
  def destroy_all
    @cart_item = current_user.cart_items.destroy_all
  end
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
