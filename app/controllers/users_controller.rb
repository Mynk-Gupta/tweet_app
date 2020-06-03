class UsersController < ApplicationController
  skip_before_action :authenticate_request

  def login
    command = AuthenticateUser.call(user_params[:email], user_params[:password])

    if command.success?
      render json: {
        token: command.result,
        message: 'You are logged in now.'
      }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
