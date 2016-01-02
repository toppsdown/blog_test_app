require 'spec_helper'

describe BlogEntriesController, :type => :controller do
  describe 'GET #index' do
    before(:each) do
      get :index
    end

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end


    let(:entry) { FactoryGirl.create(:blog_entry) }

    it 'returns blog entries' do
      expect(assigns(:entries)).to eq([entry])
    end
  end

  describe 'GET #new' do
    context 'with a logged in user' do
      before do
        sign_in
        get :new
      end

      it 'renders correct view' do
        expect(response).to render_template :new
      end

      it 'sends new blog entry' do
        returned_entry = assigns(:entry)
        expect(returned_entry.class).to eq(BlogEntry)
        expect(returned_entry.empty?).to eq(true)
      end
    end

    context 'with a non-logged in user' do
      before do
        sign_in nil
        get :new
      end

      it 'returns a 401' do
        expect(response).to have_http_status(401)
      end
    end
  end

  describe 'POST #create' do
    context 'with a logged in user' do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in(user) }

      let(:blog_entry_params) do
        {
          title: 'How I found my goat',
          body: 'It was a long summer day...'
        }
      end

      let(:http_params) { { blog_entry: blog_entry_params } }

      context 'extra params need to be filtered' do
        before do
          blog_entry_params.merge!(:other_key => '1235')
        end

        let(:expected_params) { [:title, :body, :ip] }
        let(:blog_entry) { double(:blog_entry, :save! => true)}

        # I can't figure out how to test this
        xit 'whitelists expected parameters' do
          expect(described_class).to permit(:title, :body).for(:create)

          expect(BlogEntry).to receive(:create).with(hash_including(*expected_params)).and_return(blog_entry)
          post :create, http_params
        end
      end

      context 'on successful save' do
        it 'saves new blog entry' do
          expect_any_instance_of(ActionDispatch::Request).to receive(:remote_ip).and_return('10.10.10.10')

          post :create, http_params

          user_entries = user.blog_entries
          expect(user_entries.count).to eq(1)
          user_entries.first.tap do |entry|
            expect(entry.title).to eq('How I found my goat')
            expect(entry.body).to eq('It was a long summer day...')
            expect(entry.ip).to eq('10.10.10.10')
          end
        end
      end

      it 'redirects to index' do
        post :create, http_params
        expect(response).to redirect_to action: :index
      end
    end

    context 'with a non-logged in user' do
      before { sign_in nil }

      it 'returns a 401' do
        post :create
        expect(response).to have_http_status(401)
      end
    end
  end
end
