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

    describe 'GET /tlists/:id' do 
        let!(:tlist) {create(:random_tlist)}
        let(:list_id) {Tlist.first.id}
        before (:each) do 
            get("/tlists/#{list_id}")
        end
        context 'if tlist exixts' do 
            it 'returns a success status ' do 
                expect(response).to have_http_status(:ok)
            end
            it 'it returns no empty response' do 
                json = JSON.parse(response.body)
                expect(json).not_to be_empty
                #should i test for the id??????!(refactor) 
            end
        end
        context 'if tlist does not exist' do
            let(:list_id) {3}
            it 'return Not Found status (404) ' do
                expect(response).to have_http_status(:not_found)
            end
        end
    end

    #God i hate post so much
    describe 'Post /tlists' do 
        let(:valid_list) {build(:staic_tlist)}
        context ' creates list successfuly i.e  passes validations  ' do 
            before(:each) do 
                allow(Tlist).to receive(:create).with(:valid_list)
                post('/tlists', params: { name: :valid_list.name, owner: :valid_list.owner })
            end
            it 'returns status created (201) ' do 
                expect(response).to have_http_status(:created)
            end
            #i am really confuse here my heart tell me to stub the call but
            #my brain tell to try not stub as much as you can ....
            #ok i got it it's a bad idea to bypass your validations ... but i am not testing my 
            #validataions i have already tesed them >>  i will use stubs man
            it 'creates a list ' do 
                expect(Tlist).to have_received(:create).with(:valide_list)
            end
        end

        context 'bad post request ' do
            before(:each) do 
                post('/tlists', params: { name: 'hello' })
            end
            it ' returns 422 Unprocessable Entity ' do  #i know it could be 400 but the github api uses 422
                expect(response).to have_http_status(:unprocessable_entity)
            end

        end
    end

end
