require 'rails_helper'
#Note the use of shoulda matchers..
RSpec.describe Tlist, type: :model do
  describe 'associations and validatoin tests of the model' do
    #checks the have_many asscoiation and check the dependent option is set
    it{ should have_many(:list_items).dependent(:destroy) }
    it{ should validate_presence_of(:name)}
    it{ should validate_presence_of(:owner)}
  end
end
