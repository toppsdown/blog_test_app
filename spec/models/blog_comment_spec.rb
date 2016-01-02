require 'spec_helper'

describe BlogComment do
  it 'can be created' do
    bc = FactoryGirl.create(:blog_comment)
    expect(BlogComment.all).to eq([bc])
  end

  describe 'liking' do
    it 'can be liked' do

    end
  end
end
