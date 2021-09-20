class Public::CartItemsController < ApplicationController
  
  def index
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    
    # @cart_item = current_customer.cart_items.build(cart_item_params)
    # @cart_items = current_customer.cart_items.all
    # @cart_items.each do |cart_item|
    # if cart_item.item_id == @cart_item.item_id
    #   new_amount = cart_item.amount + @cart_item.amount
    #   cart_item.update_attribute(:amount, new_amount)
    #   @cart_item.delete 
    # end
      if @cart_item.save 
        flash[:notice] = "商品がカートに追加されました"
        redirect_to public_cart_items_path
      else
        redirect_to public_items_path
      end
    # end
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash[:notice] = "一件の商品が削除されました"
    redirect_to public_cart_items_path
  end
  
  def destroy_all
    current_customer.cart_items.destroy_all
    flash[:notice] = "カートの中身が全て削除されました"
    redirect_to public_cart_items_path
  end
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
    # requireを消すといいという記事も見たがindexでエラーが発生
  end
end
