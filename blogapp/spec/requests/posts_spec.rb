require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /show' do
    it 'returns http success' do
      get '/posts/55/posts/91'
      expect(response).to have_http_status(:success)
      expect(response).to render_template('posts/show')
      
    end
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/users/54/posts'
      expect(response).to have_http_status(:success)
      expect(response).to render_template('posts/index')
    end
  end
end
