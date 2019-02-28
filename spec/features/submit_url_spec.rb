require 'rails_helper'

RSpec.feature 'Submit url', type: :feature do
  scenario 'for valid url' do
    visit '/'
    fill_in 'url[full_url]', with: 'https://www.youtube.com/watch?v=uUtymxox_G8'
    click_button 'Get url!' #TODO: css

    expect(page).to have_css('#short-url-msg')
    expect(page).to have_css('input#short_url')
  end
end
