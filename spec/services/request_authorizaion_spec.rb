require 'rails_helper'
RSpec.describe AuthManager do 
    let (:user) {create(:static_user)}
    let (:header){{'Authorization' => token_generator(user.id)}}

    subject(:invalid_req) {described_class.new}
    subject(:valid_req) {described_class.new(header)}
    describe 'calling the service' do
        context 'valid request ' do  
            it 'returns a the user instance' do 
                valid_user  = valid_req.call
                expect(valid_user).to eq(user)
            end
            
        end

        context 'invalid request' do 
            it 'raises missing token exception' do 
                expect(invalid_req.call).to raise_error(ExceptionHandler::MissingToken) 
            end
        end

        context 'invalid token --> tampered token' do 
            subject(:invalid_token_req) {described_class.call(token_generator('dd'))} 
            it 'raises not valid token exception' do 
                expect(invalid_token_req.call).to raise
            end
        end
    end 



end