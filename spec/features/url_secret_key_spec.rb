require 'rails_helper'

RSpec.feature 'Secret links', type: :feature do
  scenario 'getting secret link' do
    visit '/'
    fill_in 'link[full_url]', with: 'https://www.youtube.com/watch?v=uUtymxox_G8'
    click_button 'Get url!' #TODO: css

    expect(page).to have_css('.secret-stats-link a')
  end
  # TODO : DRY
  describe 'accessing secret link' do
    it 'returns link stats' do

      visit '/'
      fill_in 'link[full_url]', with: 'https://www.youtube.com/watch?v=uUtymxox_G8'
      click_button 'Get url!' #TODO: css

      expect(page).to have_css('.secret-stats-link a')

      find('.secret-stats-link a').click

      expect(page).to have_css('#url-stats')
    end
  end
end
