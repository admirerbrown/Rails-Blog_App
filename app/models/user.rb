class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :likes
  has_many :comments

  def recent_posts
    posts.order(created_at: :desc).limit(5)
  end
end
