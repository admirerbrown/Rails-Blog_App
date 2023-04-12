require 'rails_helper'

RSpec.feature 'UsersShows', type: :feature do
  let!(:user) { User.find(2) } # Get the user with ID 2 from the database

  # Check if the image exists or is a valid URL
  def image_exists?(url)
    response = Net::HTTP.get_response(URI.parse(url))
    response.code == '200'
  rescue StandardError
    false
  end

  it 'displays the user name and profile image' do
    visit "/users/#{user.id}"

    expect(page).to have_content(user.name)
    expect(page).to have_content(user.bio)
    expect(image_exists?(user.photo)).to be true
    expect(page).to have_content("Number of posts: #{user.posts_counter}")
    expect(page).to have_button('See all posts')
  end

  it 'shows the first 3 posts' do
    visit "/users/#{user.id}"

    user.posts.first(3).each_with_index do |post, index|
      expect(page).to have_content("Post ##{index + 1}")
      expect(page).to have_content(post.text)
    end
  end

  it 'redirects to particular post page when clicked' do
    visit "/users/#{user.id}"
    page.first(:link, 'view post', visible: true).click if page.has_link?('view post')

    user.posts.each do |post|
      post_id = post.id
      next unless page.has_link?('view post', href: user_post_path(user, post_id))

      expect(current_path).to eq(user_post_path(user, post_id))
    end
  end

  it 'see all posts button redirects me to all of the user posts' do
    visit "/users/#{user.id}"

    expect(page).to have_button('See all posts')
    page.has_link?('See all posts')

    click_link 'See all posts'
    expect(current_path).to eq(user_posts_path(user))
  end
end
