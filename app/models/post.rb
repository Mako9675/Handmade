class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :genre, optional: true
  
  has_many :post_materials, dependent: :destroy
  has_many :post_makes, dependent: :destroy
  accepts_nested_attributes_for :post_materials, :post_makes, allow_destroy: true
  
  enum status: { published: 0, draft: 1 }
  #published = 投稿する
  
  validates :title, presence: true, length: {in: 1..50}
    
  has_one_attached :post_image
  
  def get_post_image(width, height)
    unless post_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      post_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpg')
    end
    post_image.variant(resize_to_limit: [width, height]).processed
  end
  
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
