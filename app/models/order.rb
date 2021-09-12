class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items

    
  
  # def full_address
  #   self.postal_code + "" + self.address
  # end
end
