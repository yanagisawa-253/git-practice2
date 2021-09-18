class HomesController < ApplicationController
  def top
     @items = Item.where(is_active: "true")
    # limit(8).offset(4)
  end
  
  def about
  end
end
