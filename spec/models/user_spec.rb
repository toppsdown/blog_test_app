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

  context 'when creating blog comments' do
    let(:user) { FactoryGirl.create(:user) }
    let(:blog_entry) { FactoryGirl.create(:blog_entry, user: user) }

    let(:blog_comment_params) do
      {
        body: "This is the body of a comment",
        blog_entry: blog_entry
      }
    end

    it 'creates expected comments' do
      user.blog_comments.create!(blog_comment_params)
      user_comments = user.blog_comments
      expect(user_comments.count).to eq(1)
      expect(user_comments.first.body).to eq("This is the body of a comment")
      expect(user_comments.first.blog_entry).to eq(blog_entry)
    end
  end
end
