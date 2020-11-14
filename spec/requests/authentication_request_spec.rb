require 'rails_helper'

RSpec.describe "Authentications", type: :request do
  let! (:user)  {create(:static_user)}
  let (:valid_params) {{username: user.username, password: user.password}}
  let (:invalid_params) {{username: 'Stewie Griffon', password: 'shut up meg!!!'}}
  describe "Post /authenticate/login" do
    
    describe 'valid user credentilas' do 
      before(:each) do 
        post("/authenticate/login", params: valid_params)
      end

      it 'returns success status code' do 
        expect(response).to have_http_status(:ok)
      end

      it 'returns the authenticaion token' do 
        json = JSON.parse(response.body)
        expect(json['auth_token']).not_to be_nil
      end

    end
    describe 'invalid user credentilas' do 
      before(:each) do 
        post("/authenticate/login", params: invalid_params)
      end
      it 'returns invalid credentinals' do 
        expect(response).to have_http_status(:unauthorized)
      end

    end
    
  end

end
