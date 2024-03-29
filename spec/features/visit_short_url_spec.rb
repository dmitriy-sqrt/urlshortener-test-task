require 'rails_helper'

RSpec.feature 'Visit short url', type: :feature do
  context 'for existing url' do
    let(:external_url) { 'http://google.com' }
    let!(:url) do
      r = CreateLink.new(attributes: { full_url: external_url }).call
      r.object
    end

    it 'redirects to external url' do
      visit short_link_path(url)

      expect(current_url).to match(external_url)
    end

    it 'records current visit' do
      expect { visit short_link_path(url) }
        .to change(Visit, :count).from(0).to(1)
    end
  end
end
