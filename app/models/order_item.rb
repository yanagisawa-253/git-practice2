class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order
  
  def subtotal
    order_item.with_tax_price * amount
  end
end
