module FeatureHelper
  def submit_link(url: )
    visit '/'
    fill_in 'link[full_url]', with: url
    find('#submit-link-cta').click
  end
end
