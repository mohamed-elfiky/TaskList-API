require 'rails_helper'

RSpec.describe 'The list items controller', type: :request do 
    describe  'Get /tlists/:tlist_id/list_items' do 
        let!(:tlist) {create(:random_tlist)}
        let!(:item)  {create(:items_list, tlist_id: Tlist.first.id)}
        before(:each) do 
            get("/tlists/#{:tlist_id}/list_items")
        end
        context 'the list exists' do
            it 'returns satus :ok' do 
                expect(response).to have_status_http(:ok)
            end
            it 'json response is not empty' do
                json = JSON.parse(response.body)
                expect(json.size).to eq(1)
            end
        end
    end

end
