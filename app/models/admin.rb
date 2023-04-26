class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:email]
         
  has_one_attached :owner_image
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  
  def get_owner_image(width, height)
    unless owner_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      owner_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpg')
    end
    owner_image.variant(resize_to_limit: [width, height]).processed
  end
end
