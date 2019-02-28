require 'rails_helper'

RSpec.feature 'Home page', type: :feature do
  it 'shows new link creation form' do
    visit '/'

    expect(page).to have_css('.home-welcome-msg')
    expect(page).to have_css('form#submit-link')
  end
end
