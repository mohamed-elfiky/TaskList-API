require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations and validations test for the user model' do
    context 'associations check test' do 
      it{should have_many(:tlists).dependent(:destroy)}
    end
    
    context 'validation check test ' do 
      it { should validate_presence_of(:username)}
      it { should validate_presence_of(:password_digest)}
    end

  end
end
