require 'rails_helper'

RSpec.describe Post, type: :model do
  user1 = User.new(name: 'John', photo: 'http//:www.myphoto.com', bio: 'software developer from Germany')
  post = Post.create(author: user1, title: 'Hello', text: 'This is my first post')

  it 'title should be present' do
    check = user1.valid?

    expect(check).to eq(true)
  end

  it 'title should not be more than 250 ' do
    post_title = post.title
    post_length = post_title.size

    expect(post_length).to be <= 250
  end

  it 'posts_counter should be greater than or equal to zero' do
    comments_counter = post.comments_counter

    expect(comments_counter).to be >= 0
  end

  it 'likes_counter should be greater than or equal to zero' do
    likes_counter = post.likes_counter

    expect(likes_counter).to be >= 0
  end

  it '#update_post_counter should increase post_counter by 1' do
    post.update_post_counter
    check = user1.posts_counter

    expect(check).to be > 0
  end
end
