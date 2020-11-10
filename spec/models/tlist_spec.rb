require 'rails_helper'
#Note the use of shoulda matchers..
RSpec.describe Tlist, type: :model do
  describe 'associations and validatoin tests of the model' do
    context 'association check test' do  
      it{ should have_many(:list_items).dependent(:destroy) }
    end
    context 'validation check test' do 
      it{ should validate_presence_of(:name)}
      it{ should validate_presence_of(:owner)}
    end
  end
end
