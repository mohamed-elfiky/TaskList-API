require 'rails_helper'

RSpec.describe 'Tlist requests', type: :request do 
    # get the index action
    describe 'GET /tlists' do 
        let!(:tlist) {create(:random_tlist)} 
        before (:each) do 
            get('/tlists')
        end
        it 'returns a success status ' do 
            expect(response).to have_http_status(:ok)
        end

        it 'returns a json response with one element' do
            json = JSON.parse(response.body)
            expect(json.size).to eq(1)
        end
    end

end
