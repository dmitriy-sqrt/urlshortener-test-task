require 'rails_helper'

RSpec.feature 'Submit', type: :feature do
  context 'for valid link' do
    it 'shows generated short link' do
      visit '/'
      fill_in 'link[full_url]', with: 'https://www.youtube.com/watch?v=uUtymxox_G8'
      find('#submit-link-cta').click

      expect(page).to have_css('#short-url-msg')
      expect(page).to have_css('input#short_url')
    end
  end

  context 'for invalid link' do
    it 'shows error message' do
      visit '/'
      fill_in 'link[full_url]', with: 'notvalidurl'
      find('#submit-link-cta').click

      expect(page).to have_css('.alert-danger', text: /is not a valid link/)
    end
  end
end
