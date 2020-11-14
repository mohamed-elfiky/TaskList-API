module  ServicesSpecHelper

    def token_generator (id)
        JsonWebToken.encode(user_id: id) 
    end


end