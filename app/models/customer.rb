class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def active_for_authentication?
    super && (self.is_active == false)
  end
  
  def full_name
    self.last_name + "" + self.first_name
  end
  
  def full_name_kana
    self.last_name_kana + "" + self.first_name_kana
  end 
  # フルネームの定義を行うことでview表示できる
end
