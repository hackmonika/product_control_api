class JsonWebToken
  SECRET_KEY = Rails.application.secret_key_base

  # Gera o token JWT
  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  # Decodifica e valida o token JWT
  def self.decode(token)
    body = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new(body)
  rescue JWT::DecodeError => e
    raise StandardError, e.message
  end
end
