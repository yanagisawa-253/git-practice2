class Public::CartItemsController < ApplicationController
    def index
    @cart_items = CartItem.all
  end
  
  def create
    @cart_item.save
    if 
      
    else
      
    end
  end
  
  def destroy
    
  end
  
  def destroy_all
    current_user.books.destroy_all
  end
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
