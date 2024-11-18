class SessionsController < ApplicationController
  TODO:  pra remover autenticacao eh so remover abaixo
  skip :authenticate_request, only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def new
  end

  def create
    if user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: user.id)
      render json: { token: token, user: { id: user.id, email: user.email } }, status: :ok
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  def destroy
    terminate_session
    redirect_to new_session_path
  end
end
