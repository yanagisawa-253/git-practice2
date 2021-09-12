class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items

  enum payment_method: { credit_card: 0, transfer: 1 }
  
  def full_address
    self.postal_code + "" + self.address
  end
end
