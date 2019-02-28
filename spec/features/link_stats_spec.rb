require 'rails_helper'

RSpec.feature 'Link stats', type: :feature do
  describe 'accessing secret link' do
    let!(:link) do
      r = CreateLink.new(attributes: { full_url: 'http://google.com' }).call
      r.object
    end

    it 'shows link stats and allows csv export' do
      visit short_link_path(link) #simulate user visit for the link

      visit dashboard_stat_path(link.secret)
      expect(page).to have_css('#link-visits')
      expect(page).to have_css('#link-visits-csv-export')
    end
  end
end
