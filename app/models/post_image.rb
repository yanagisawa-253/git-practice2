class PostImage < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :post_comments, dependent: :destroy
  
  validates :shop_name, presence: true
  validates :image, presence: true
  
end
