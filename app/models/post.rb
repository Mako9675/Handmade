class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :genre, optional: true
    
  has_one_attached :post_image
    
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
