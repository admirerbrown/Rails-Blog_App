require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  user = User.create(name: 'Example User', bio: 'Example Bio', photo: 'https://i.imgur.com/8Qq7YQq.jpg')
  post = Post.create(title: 'Example Title', text: 'Example Text', author_id: user.id)
  post.update_post_counter
  it 'displays the post title' do
    visit "/users/#{user.id}/posts/#{post.id}"
    expect(page).to have_content(post.title)
  end
  it 'displays the post author' do
    visit "/users/#{user.id}/posts/#{post.id}"
    expect(page).to have_content(post.author.name)
  end
  it 'displays the number of comments on a post' do
    visit "/users/#{user.id}/posts/#{post.id}"
    comment = Comment.create(text: 'Example Text', user_id: user.id, post_id: post.id)
    comment.update_comments_counter
    expect(page).to have_content("Comments:#{post.comments_counter}")
  end
  it 'displays the number of likes on a post' do
    visit "/users/#{user.id}/posts/#{post.id}"
    like = Like.create(post_id: post.id, user_id: user.id)
    like.update_likes_counter
    expect(page).to have_content("Likes:#{post.likes_counter}")
  end
  it 'displays the post text' do
    visit "/users/#{user.id}/posts/#{post.id}"
    expect(page).to have_content(post.text)
  end
  it 'displays the comment author' do
    visit "/users/#{user.id}/posts/#{post.id}"
    comment = Comment.create(text: 'Example Text', user_id: user.id, post_id: post.id)
    comment.update_comments_counter
    expect(page).to have_content(comment.user.name)
  end
  it 'displays the comment text' do
    visit "/users/#{user.id}/posts/#{post.id}"
    comment = Comment.create(text: 'Example Text', user_id: user.id, post_id: post.id)
    comment.update_comments_counter
    expect(page).to have_content(comment.text)
  end
end
