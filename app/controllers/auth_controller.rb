class AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]
  def create
    user = User.find_by(user_name: login_user_params[:user_name])
    if user && user.authenticate(login_user_params[:password])
      token = JWT.encode({user_id: user.id}, 'SECRET')
      render json: {user: user, jwt:token}
    else
      render json: {error: ""}, status: 400
    end
  end

  def show
      render json: {user: current_user}
  end

  private
  def login_user_params
    params.require(:user).permit(:user_name, :password)
  end
end
