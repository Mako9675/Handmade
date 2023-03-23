class PostMaterial < ApplicationRecord
  belongs_to :post
  
  validates :ing_name, presence: true, length: {in: 1..50}
  validates :quantity, presence: true, length: {in: 1..50}
end
