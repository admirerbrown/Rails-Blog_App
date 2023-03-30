require 'rails_helper'

RSpec.describe Like, type: :model do
  it '#update_likes_counter should increase post_likes_counter by 1' do
    user1 = User.new(name: 'John', photo: 'http//:www.myphoto.com', bio: 'software developer from Germany')
    post = Post.create(author: user1, title: 'Hello', text: 'This is my first post')
    like = Like.create(post: post, user_id: user1)

    like.update_likes_counter
    check = post.likes_counter

    expect(check).to be > 0
  end
end
