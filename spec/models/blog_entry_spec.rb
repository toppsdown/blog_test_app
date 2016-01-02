require 'spec_helper'

describe BlogEntry do
  describe 'new' do
    it 'can be created and saved' do
      expect{BlogEntry.new.save!}.to_not raise_error
    end

    let(:expected_attributes) do
      [ "id", "title", "body", "ip", "created_at", "updated_at", "user_id" ]
    end

    it 'responds to expected attributes' do
      expect(BlogEntry.attribute_names).to match_array(expected_attributes)
    end
  end

  describe 'empty?' do
    context 'when empty' do
      it 'returns true' do
        expect(BlogEntry.new.empty?).to eq(true)
      end
    end

    context 'when not empty' do
      it 'returns false' do
        expect(BlogEntry.new({title: '1234'}).empty?).to eq(false)
      end
    end
  end
end
