require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /show' do
    it 'returns http success' do
      get '/users/54'
      expect(response).to have_http_status(:success)
      expect(response).to render_template('users/show')
    end
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
      expect(response).to render_template('users/index')
    end
  end
end
