module ErrorHanlder  
    
    class AuthenticationError < StandardError; end
    class MissingToken < StandardError; end
    class InvalidToken < StandardError; end
    
    
    def self.included(clazz)
        clazz.class_eval do 
            rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
            rescue_from ActiveRecord::RecordInvalid, with: :record_not_valid
            rescue_from ErrorHanlder::AuthenticationError, with: :authentication_error
            rescue_from ErrorHanlder::MissingToken, with: :record_not_valid
            rescue_from ErrorHanlder::InvalidToken, with: :record_not_valid
        end
    end
    


    private 
    def record_not_found(e)
        render json: e.message, status: :not_found
    end

    def record_not_valid(e)
        render json: e.message, status: :unprocessable_entity 
    end

    def authentication_error(e)
        render json: e.message, status: :unauthorized
    end
end