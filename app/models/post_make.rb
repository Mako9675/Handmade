class PostMake < ApplicationRecord
  belongs_to :post
  
  has_one_attached :make_image
  
  def get_make_image(width, height)
    unless make_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      make_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpg')
    end
    make_image.variant(resize_to_limit: [width, height]).processed
  end
end
