class Relationship < ApplicationRecord
  belongs_to :follow, class_name: "User"
  belongs_to :follower, class_name: "User"
  validates :follow, presence: true
  validates :follower, presence: true
end
