class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
  def index
    @users = User.all
    render json: @users
  end
  def show
       @user = User.find(params[:id])
       render json: @user
   end

   def create
     @user = User.create(user_params)
     if @user.valid?
       token = JWT.encode({user_id: @user.id}, "SECRET")
       render json: {user: @user, jwt: token}
     else
       render json: {error: `#{@user.valid?}`}, status: 402
     end
   end


   private
   def user_params
      params.require(:user).permit(:user_name, :password, :password_confirmation, :first_name, :last_name, :cash)
   end
end
