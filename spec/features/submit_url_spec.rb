require 'rails_helper'

RSpec.feature 'Submit', type: :feature do
  context 'for valid link' do
    it 'shows generated short link' do
      submit_link(url: 'https://www.youtube.com/watch?v=qApaVLZmH1A')

      expect(page).to have_css('#short-url-msg')
      expect(page).to have_css('input#short_url')
    end
  end

  context 'for invalid link' do
    it 'shows error message' do
      submit_link(url: 'notvalidurl')

      expect(page).to have_css('.alert-danger', text: /is not a valid link/)
    end
  end
end
