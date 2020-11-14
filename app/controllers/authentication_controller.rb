require_relative('../services/AuthManager/user_authenticator')
class AuthenticationController < ApplicationController    
  def authenticate
    token = AuthManager::UserAuthenticator.call(params[:username], params[:password])
    render json: {auth_token: token}
  end
end
