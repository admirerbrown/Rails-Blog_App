require 'rails_helper'
RSpec.feature 'Posts', type: :feature do
  user = User.create(name: 'Example User', bio: 'Example Bio', photo: 'https://i.imgur.com/8Qq7YQq.jpg')
  post = Post.create(title: 'Example Title', text: 'Example Text', author_id: user.id)
  post.update_post_counter
  it 'displays the post title' do
    visit "/users/#{user.id}/posts/"
    expect(page).to have_content(post.title)
  end
  it 'displays the post body' do
    visit "/users/#{user.id}/posts/"
    expect(page).to have_content(post.text)
  end
  it 'displays the user profile picture' do
    visit "/users/#{user.id}/posts/"
    expect(page).to have_css("img[src*='https://i.imgur.com/8Qq7YQq.jpg']")
  end
  it 'displays the number of comments on a post' do
    comment = Comment.create(text: 'Example Text', user_id: user.id, post_id: post.id)
    comment.update_comments_counter
    visit "/users/#{user.id}/posts/"
    expect(page).to have_content('1')
  end
  it 'displays the number of likes on a post' do
    post = Post.create(title: 'Example Title', text: 'Example Text', author_id: user.id)
    like = Like.create(post_id: post.id, user_id: user.id)
    like.update_likes_counter
    visit "/users/#{user.id}/posts/"
    expect(page).to have_content('1')
  end
  it 'redirects to particular post page when clicked' do
    visit "/users/#{user.id}/posts/"
    page.first(:link, 'view post', visible: true).click if page.has_link?('view post')
    user.posts.each do |pt|
      post_id = pt.id
      next unless page.has_link?('view post', href: user_post_path(user, post_id))
      expect(current_path).to eq(user_post_path(user, post_id))
    end
  end
end