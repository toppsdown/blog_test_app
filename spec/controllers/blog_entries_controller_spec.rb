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
end
