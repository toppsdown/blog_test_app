require 'spec_helper'

describe BlogEntry do
  describe 'new' do
    it 'can be created and saved' do
      expect{BlogEntry.new.save!}.to_not raise_error
    end

    let(:expected_attributes) do
      [ "id", "title", "body", "ip", "created_at", "updated_at" ]
    end

    it 'responds to expected attributes' do
      expect(BlogEntry.attribute_names).to match_array(expected_attributes)
    end
  end
end
