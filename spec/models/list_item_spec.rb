require 'rails_helper'

RSpec.describe ListItem, type: :model do
  describe 'testing validations and associations ' do 
    context 'check associations' do 
      it{ should belong_to(:tlist)}
    end
    context 'check validations' do 
      it{ should validate_presence_of(:name) }
      it{ should validate_presence_of(:status) }
    end
  end
end
