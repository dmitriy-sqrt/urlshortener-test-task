require 'rails_helper'

RSpec.feature 'Secret links', type: :feature do
  describe 'accessing secret link' do
    it 'gets user to link stats' do
      visit '/'
      fill_in 'link[full_url]', with: 'https://www.youtube.com/watch?v=uUtymxox_G8'
      find('#submit-link-cta').click

      find('.secret-stats-link a').click

      expect(page).to have_css('#url-stats')
    end
  end
end
