require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET /index' do
    it 'returns a success response' do
      get '/users/'
      expect(response).to be_successful
    end

    it 'renders the index template of views/users' do
      get '/users/'
      expect(response).to render_template(:index)
    end
  end
  it 'includes the correct placeholder text' do
    get '/users/'
    result = response.body
    expect(result).to include('here is a list of all users')
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get '/users/745'
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get '/users/745'
      expect(response).to render_template(:show)
    end

    it 'includes the correct placeholder text' do
      get '/users/745'
      result = response.body
      expect(result).to include('here is the details for a given user')
    end
  end
end
