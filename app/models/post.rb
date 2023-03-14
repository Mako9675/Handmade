class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :genre, optional: true
    
  has_one_attached :post_image
  
  with_options presence: true, on: :publicize do
    validates :title
    validates :material
    validates :body
  end
  
  validate :title, on: :publicize
  validate :material, on: :publicize
  validate :body, on: :publicize
    
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def self.search(search)
    if search != ""
      Post.where("title LIKE(?)", "%#{search}%")
    else
      Post.all
    end
  end
end
