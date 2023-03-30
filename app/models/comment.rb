class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post

  def update_comments_counter
    post.update(comments_counter: post.comments_counter + 1)
  end
end
