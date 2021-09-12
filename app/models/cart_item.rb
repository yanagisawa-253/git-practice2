class CartItem < ApplicationRecord
  belongs_to :item
  
  def subtotal
    item.with_tax_price * amount
  end
  
  def total
    subtotal + subtotal
  end
end