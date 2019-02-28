require 'rails_helper'

RSpec.feature 'Home page', type: :feature do
  scenario 'User visits home page' do
    visit '/'

    expect(page).to have_css('.home-welcome-msg')
    expect(page).to have_css('#submit-link-form')
  end
end
