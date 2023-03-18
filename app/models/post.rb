class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :genre, optional: true
  
  has_many :post_materials, dependent: :destroy
  has_many :post_makes, dependent: :destroy
  accepts_nested_attributes_for :post_materials, :post_makes, allow_destroy: true
    
  has_one_attached :post_image
  
  enum status: { published: 0, draft: 1 }
  #published = 投稿する
  
  validate :title
    
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
