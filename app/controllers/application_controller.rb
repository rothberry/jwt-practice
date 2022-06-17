class ApplicationController < ActionController::API
  before_action :confirm_auth
  # ! JWTing

  def auth_header
    request.headers["Authorization"]
  end

  def encode_token(payload)
    return JWT.encode(payload, "s3cR3t")
  end

  def decode_token #(token)
    if auth_header
      token = auth_header.split(" ").last

      begin
        JWT.decode(token, "s3cR3t")
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    if decode_token
      # username = decode_token[0]["username"]
      user_id = decode_token[0]["user_id"]
      # @user = User.find_by(username: username)
      @user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !!current_user
  end

  def confirm_auth
    render json: { message: "PLEASE LOG IN" }, status: :unauthorized unless logged_in?
  end
end
