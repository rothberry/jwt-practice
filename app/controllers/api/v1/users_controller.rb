class Api::V1::UsersController < ApplicationController
  skip_before_action :confirm_auth, only: [:create]

  def index
    render json: User.all
  end

  def profile
    render json: current_user, status: :accepted, serializer: UserSerializer
  end

  def create
    puts "CREATING USER..."
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      # @token = encode_token(username: @user.username)
      render json: { user: @user, jwt: @token }, status: :created
    else
      render json: { error: "FAILED" }, status: 422
    end
  end

  private

  def user_params
    params.permit(:username, :password, :bio)
  end
end
