require 'rails_helper'

RSpec.feature 'Secret links', type: :feature do
  describe 'accessing secret link' do
    it 'gets user to link stats' do
      submit_link(url: 'https://www.youtube.com/watch?v=qApaVLZmH1A')

      find('.secret-stats-link a').click

      expect(page).to have_css('#url-stats')
    end
  end
end
