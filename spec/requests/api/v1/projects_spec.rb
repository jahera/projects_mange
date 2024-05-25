# require 'rails_helper'

# RSpec.describe "Api::V1::Projects", type: :request do
#   let(:user_role) { create(:user_role) }
#   let(:tenant) { create(:tenant) }
#   let(:user) { create(:user, tenant: tenant, user_role: user_role, password: '123456') }
#   # let(:token) { generate_jwt_token(user) }
#   let(:auth_headers) { user.create_new_auth_token }

#   before do
#     # Sign in the user
#     sign_in user
#   end

#   describe "GET /api/v1/projects" do
#     it "returns a list of projects" do
#       # create_list(:project, 3, tenant: tenant)
#       get api_v1_projects_path, headers: auth_headers

#       expect(response).to have_http_status(:ok)
#       expect(json.size).to eq(3)
#     end
#   end

#   describe "GET /api/v1/projects/:id" do
#     it "returns a specific project" do
#       project = create(:project, user_id: user)
#       get api_v1_project_path(project), headers: auth_headers

#       expect(response).to have_http_status(:ok)
#       expect(json['id']).to eq(project.id)
#     end
#   end

#   describe "POST /api/v1/projects" do
#     it "creates a new project" do
#       project_params = { project: { name: "New Project", description: "Project description", status: 'new' } }
#       post api_v1_projects_path, params: project_params, headers: auth_headers

#       expect(response).to have_http_status(:created)
#       expect(json['name']).to eq("New Project")
#     end
#   end

#   describe "PUT /api/v1/projects/:id" do
#     it "updates an existing project" do
#       project = create(:project, user_id: user)
#       update_params = { project: { name: "Updated Project" } }
#       put api_v1_project_path(project), params: update_params, headers: auth_headers

#       expect(response).to have_http_status(:ok)
#       expect(json['name']).to eq("Updated Project")
#     end
#   end

#   describe "DELETE /api/v1/projects/:id" do
#     it "deletes a project" do
#       project = create(:project, user_id: user)
#       delete api_v1_project_path(project), headers: auth_headers

#       expect(response).to have_http_status(:no_content)
#       expect(Project.exists?(project.id)).to be_falsey
#     end
#   end
# end

# # Helper to parse JSON responses
# def json
#   JSON.parse(response.body)
# end
