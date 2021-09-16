class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items


  enum pay_type: { credit_card: 0, transfer: 1 }
  
  def sum_of_price
    item.with_tax_price * amount
  end
  
  def full_address 
    self.postal_code + "" + self.address
  end
end
