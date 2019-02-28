require 'rails_helper'

RSpec.feature 'Secret links', type: :feature do
  describe 'accessing secret link' do
    it 'shows link stats' do
      visit '/'
      fill_in 'link[full_url]', with: 'https://www.youtube.com/watch?v=uUtymxox_G8'
      click_button 'Get url!' #TODO: css
      find('.secret-stats-link a').click

      expect(page).to have_css('#url-stats')
    end
  end
end
