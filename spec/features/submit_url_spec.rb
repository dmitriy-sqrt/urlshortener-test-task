require 'rails_helper'

RSpec.feature 'Submit url', type: :feature do
  scenario 'for valid url' do
    visit '/'
    fill_in 'link[full_url]', with: 'https://www.youtube.com/watch?v=uUtymxox_G8'
    click_button 'Get url!' #TODO: css

    expect(page).to have_css('#short-url-msg')
    expect(page).to have_css('input#short_url')
  end

  scenario 'for invalid url' do
    visit '/'
    fill_in 'link[full_url]', with: 'notvalidurl'
    click_button 'Get url!' #TODO: css

    expect(page).to have_css('.alert-danger', text: /is not a valid link/)
  end
end
