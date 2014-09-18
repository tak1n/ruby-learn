require 'test_helper'

feature 'My Awesome demo feature' do
  scenario 'a scenario' do
    visit '/'

    page.must_have_content("Listing posts")
  end

  # scenario 'a js scenario', js: true do
  #   page.must_have_content('JS CONTENT')
  # end
end
