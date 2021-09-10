class Item < ApplicationRecord
  belongs_to :genre
  
  has_many :cart_items
  has_many :order_items
  
  attachment :image
  
  def with_tax_price
    (price * 1.1).floor
  end
  
  def subtotal
    item.with_tax_price * amount
  end
end
