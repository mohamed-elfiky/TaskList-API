module AuthManager
    class UserAuthenticator < ApplicaionService
        attr_reader :username, :password
        def initialize(username, password) 
            @username = username
            @password = password
        end
    end

    # is should return a vlid user instance if the 
    # user actually exists (login service)
    def call 
        JsonWebToken.encode(user_id: user.id) if user
    end

    private 

    # check for valid user credentials
    def user 
        user = User.find_by(username: @username)
        return user if user && user.authenticate(@password)
        raise(ExceptionHandler::AuthneticaionError, 'invalid credentials')
    end



end