require 'rails_helper'

RSpec.describe User, type: :model do
  it 'name should be present' do
    user1 = User.new(name: 'John', photo: 'http//:www.myphoto.com', bio: 'software developer from Germany')
    check = user1.valid?

    expect(check).to eq(true)
  end

  it 'name should be present' do
    user = User.new(name: '', photo: 'http//:www.myphoto.com', bio: 'software developer from Germany')
    check = user.valid?

    expect(check).to eq(false)
  end

  it 'posts_counter should be greater than or equal to zero' do
    user2 = User.new(name: 'John', photo: 'http//:www.myphoto.com', bio: 'software developer from Germany')
    check = user2.posts_counter

    expect(check).to be >= 0
  end

  it '#recent_posts should show 3 recent posts of user' do
    first_user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
    Post.create(author: first_user, title: 'Hello', text: 'This is my second post')
    Post.create(author: first_user, title: 'Hello', text: 'This is my third post')
    Post.create(author: first_user, title: 'Hello', text: 'This is my fourth post')
    Post.create(author: first_user, title: 'Hello', text: 'This is my fifth post')
    curr_posts = first_user.recent_posts
    result = curr_posts.size

    expect(result).to eq(3)
  end
end
