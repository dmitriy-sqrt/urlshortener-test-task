require "rails_helper"

RSpec.feature "Home page", type: :feature do
  scenario "User visits home page" do
    visit "/"

    expect(page).to have_text("Welcome to url shortener!")
    expect(page).to have_css("#submit-url-form")
  end
end
