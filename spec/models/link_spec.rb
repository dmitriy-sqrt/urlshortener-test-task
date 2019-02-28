require 'rails_helper'

describe Link, type: :model do
  describe 'with trashy full_url' do
    let(:invalid_urls) do
      [
        'noturl',
        '://http://www',
      ]
    end

    it 'is marked as invalid' do
      invalid_urls.each do |invalid_url|
        record = Link.create(full_url: invalid_url)
        expect(record.errors[:full_url]).to be_present
      end
    end
  end
end
