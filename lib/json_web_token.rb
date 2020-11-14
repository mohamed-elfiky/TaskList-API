# Token = header + payload + signature

class JsonWebToken
    class << self
        def encode(payload, exp = 24.hours.from_now)
            payload[:exp] = exp.to_i
            JWT.encode(payload, Rails.application.secrets.secret_key_base)
        end

        def decode(token) 
            ### get the payload
            body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
            HashWithIndifferentAccess.new body
            rescue JWT::DecodeError => e 
                raise ExceptionHandler::InvalidToken, e.message
        end
    end
end