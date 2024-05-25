class Api::V1::SessionsController < Devise::SessionsController

	respond_to :json

  def create
    user = User.find_by_email(sign_in_params[:email])
    if user && user.valid_password?(sign_in_params[:password])
      token = JsonWebToken.encode(user_id: user.id)
      render json: { token: token }, status: :created
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def destroy
    # Handle logout if needed, JWTs are stateless so usually there's nothing to do here
    head :no_content
  end

  private

  def respond_with(resource, _opts = {})
    render json: resource
  end

  def respond_to_on_destroy
    head :no_content
  end
end
