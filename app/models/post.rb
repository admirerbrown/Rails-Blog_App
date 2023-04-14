class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, foreign_key: :post_id, dependent: :destroy
  has_many :comments, foreign_key: :post_id, dependent: :destroy
  # has_many :comments,
  # has_many :likes,

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  def update_post_counter
    author.update(posts_counter: author.posts_counter + 1)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
