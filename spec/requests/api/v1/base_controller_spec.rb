require 'rails_helper'

RSpec.describe Api::V1::BaseController, type: :request do
  let(:user_role) { create(:user_role) }
  let(:tenant) { create(:tenant) }
  let(:user) { create(:user, tenant: tenant, user_role: user_role, password: '123456') }
  let(:token) { generate_jwt_token(user) }
  let(:headers) { { 'Authorization' => "Bearer #{token}" } }

end
