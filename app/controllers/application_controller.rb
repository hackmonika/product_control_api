class ApplicationController < ActionController::API
  # TODO:  pra remover autenticacao eh so remover abaixo
  # before_action :authenticate_request

  private

  def authenticate_request
    header = request.headers["Authorization"]
    header = header.split(" ").last if header

    begin
      decoded = JsonWebToken.decode(header)
      @current_user = User.find(decoded[:user_id])
    rescue StandardError => e
      render json: { error: "Unauthorized access" }, status: :unauthorized
    end
  end
end
