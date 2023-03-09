class Post < ApplicationRecord
    belongs_to :genre, dependent: :destroy
end
