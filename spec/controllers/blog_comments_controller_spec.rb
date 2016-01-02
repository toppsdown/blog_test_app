require 'spec_helper'

describe BlogCommentsController, :type => :controller do
  describe 'POST #create' do
    before do
      sign_in user
    end

    context 'with all valid params' do
      let(:user) { FactoryGirl.create(:user) }
      let(:blog_entry) { FactoryGirl.create(:blog_entry) }

      let(:blog_comment_params) do
        {
          blog_comment:
          {
            body: "I too once had a goat",
            blog_entry_id: blog_entry.id
          }
        }
      end

      it 'creates blog comment and associates it correctly' do
        post :create, blog_comment_params

        user_comment = user.blog_comments.first
        expect(user_comment.body).to eq("I too once had a goat")

        blog_entry_comment = blog_entry.blog_comments.first
        expect(blog_entry_comment).to eq(user_comment)
      end
    end
  end
end
