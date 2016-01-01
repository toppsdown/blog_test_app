require 'spec_helper'

describe User, type: :model do
  it 'can be created' do
    f = FactoryGirl.create(:user)
    expect(User.all).to eq([f])
  end

  context 'validate display name' do
    context 'is missing' do
      let(:user_sans_displayname) do
        FactoryGirl.build(:user, :display_name => nil)
      end

      it 'is not valid' do
        expect(user_sans_displayname.valid?).to be_falsey
      end
    end

    context 'is not unique' do
      let(:user_duplicate_displayname) do
        FactoryGirl.build(:user, :display_name => 'thedude')
      end

      before do
        FactoryGirl.create(:user, display_name: 'thedude' )
      end

      it 'is not valid' do
        expect(user_duplicate_displayname.valid?).to be_falsey
      end
    end
  end
end
