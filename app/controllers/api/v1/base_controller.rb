class Api::V1::BaseController < ActionController::API
	include Pundit::Authorization
	before_action :authenticate_user!
  before_action :switch_tenant_schema

	# Disable CSRF protection for API controllers
  # protect_from_forgery unless: -> { request.format.json? }
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def authenticate_user!
    token = request.headers['Authorization']&.split(' ')&.last
    decoded_token = JsonWebToken.decode(token)

     if decoded_token.nil? || decoded_token.empty?
      render json: { error: 'Unauthorized' }, status: :unauthorized
    else
      @current_user = User.find(decoded_token['user_id'])
    end
  rescue JWT::DecodeError
    render json: { error: 'Invalid token' }, status: :unauthorized
  end

  def user_not_authorized
    render json: { error: 'You are not authorized to perform this action.', status: :unauthorized}
  end
  
protected

  def switch_tenant_schema
    if current_user
      tenant = Tenant.find(current_user.tenant_id)
      Apartment::Tenant.switch!(tenant.name) if tenant
      @current_tenant = tenant
    end
  end
end
