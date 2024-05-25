# spec/requests/api/v1/sessions_spec.rb
require 'rails_helper'

RSpec.describe "Api::V1::SessionsController", type: :request do
  let(:user_role) { create(:user_role) }
  let(:tenant) { create(:tenant) }
  let(:user) { create(:user, tenant: tenant, user_role: user_role, password: '123456') }
  let(:token) { generate_jwt_token(user) }
  let(:headers) { { 'Authorization' => "Bearer #{token}" } }

  let(:valid_credentials) { { "user": { email: user.email, password: '123456' } } }
  let(:invalid_credentials) { { "user": { email: user.email, password: 'wrongpassword' } } }

  describe 'POST /api/v1/login' do
    context 'with valid credentials' do
      it 'returns a JWT token' do
        post '/api/v1/login', params: valid_credentials, as: :json
        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)).to have_key('token')
      end
    end

    context 'with invalid credentials' do
      it 'returns unauthorized status' do
        post '/api/v1/login', params: invalid_credentials
        expect(response).to have_http_status(:unauthorized)
        expect(JSON.parse(response.body)['error']).to eq('Invalid email or password')
      end
    end
  end

  describe 'DELETE /api/v1/logout' do
    it 'returns success message' do
      delete '/api/v1/logout', as: :json
      expect(response).to have_http_status(:no_content)
    end
  end
end
