module AuthManager 
    #sorry for the bad naming i am just following a convention
    #for naming POROs
    class RequestAuthorizator < ApplicationSercive
        attr_reader :header
        
        def initialize (header = {})
            @header = header
        end   

        # should return a user instance if the token is valid
        def call 
            user
        end

        private 

        # momoize it if the user exist in the database 
        def user 
            @user ||= User.find(decoded_token[:user_id]) if decoded_token
            rescue ActiveRecord::RecordNotFound => e 
                raise (ExceptionHandler::InvalidToken, e.message)
        end

        #decode the token
        def decoded_token
            @decoded_token ||= JsonWebTocken.decode(http_auth_header)
        end

        #get the token from the header 
        def http_auth_header
            if header['Authorization'].present?
                return header['Authorization'].split(' ').last
            end
                raise(ExceptionHandler::MissingToken, 'Missing_token') #should be refactored into a singleton class man            
        end

    end       

end