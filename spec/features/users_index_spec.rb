require 'rails_helper'

RSpec.feature 'UsersIndices', type: :feature do
  let!(:user) { User.find(4) } # Get the user with ID 1 from the database

  # Check if the image exists or is a valid URL
  def image_exists?(url)
    response = Net::HTTP.get_response(URI.parse(url))
    response.code == '200'
  rescue StandardError
    false
  end

  it 'displays the user name and profile image' do
    visit '/users'

    profile_link = page.find("a[href='#{user_path(user.id)}']", text: 'View Profile')
    profile_link.click

    expect(page).to have_content(user.name)
    expect(image_exists?(user.photo)).to be true
    expect(page).to have_content("Number of posts: #{user.posts_counter}")
    expect(current_path).to eq(user_path(user.id))
  end
end
