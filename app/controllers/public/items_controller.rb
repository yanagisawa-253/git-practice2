class Public::ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def create
    if Item.find_by(item_params)
      puts "商品が存在します"
    else
      
    end
  end

private
def item_params
  params.require(:item).permit(:genre_id, :name, :image_id, :introduction, :price, :is_active)
end

end
