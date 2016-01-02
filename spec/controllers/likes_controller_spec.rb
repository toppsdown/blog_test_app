require 'spec_helper'

describe LikesController, type: :controller do
  context 'user signed in' do
    let(:user) { FactoryGirl.create(:user) }

    before do
      sign_in :user
    end

    context 'liking a comment' do
      let(:comment) { FactoryGirl.create(:blog_comment) }

      it 'adds like to comment as user' do
        post :create, blog_entry_id: comment.blog_entry, blog_comment_id: comment

        expect(comment.likes.count).to eq(1)
        expect(comment.likes.first.user).to eq(user)
      end
    end

    context 'liking a blog entry' do
      it 'adds like to entry as user' do

      end
    end
  end
end
