class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  
  validates :item_id, :amount, presence: true
  validates :amount, numericality:{ only_integer: true }
  
  def sum_of_price
    item.with_tax_price * amount
  end 
end