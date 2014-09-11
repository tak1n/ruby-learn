require "test_helper"

feature "My Awesome demo feature" do
  scenario "a scenario" do
    page.must_have_content("CONTENT")
  end

  scenario "a js scenario", js: true do
    page.must_have_content("JS CONTENT")
  end
end
