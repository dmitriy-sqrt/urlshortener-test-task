require 'rails_helper'

RSpec.feature 'Visit short url', type: :feature do
  context 'for existing url' do
    let(:external_url) { 'http://google.com' }
    let!(:url) do
      r = CreateUrl.new(attributes: { full_url: external_url }).call
      r.object
    end

    it 'redirects to external url' do
      visit short_url_path(url)

      expect(current_url).to match(external_url)
    end
  end

  context 'for non existing url' do
    xit 'renders error page' do
      visit '/abracarabra'
    end
  end
end
