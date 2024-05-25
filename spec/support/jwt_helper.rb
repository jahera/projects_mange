module JwtHelper
  def generate_jwt_token(user)
    JsonWebToken.encode(user_id: user.id)
  end
end

RSpec.configure do |config|
  config.include JwtHelper
end