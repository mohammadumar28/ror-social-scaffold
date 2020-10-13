class Like < ApplicationRecord
  validates :user_id, uniqueness: { scope: :post_id }


  scope :count_likes, -> { count("post_id") }
  belongs_to :user
  belongs_to :post
end
