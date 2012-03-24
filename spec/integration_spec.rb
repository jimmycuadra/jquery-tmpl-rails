require "spec_helper"

feature "Using jquery-tmpl-rails", js: true do
  scenario "Loading a page using a jQuery template" do
    visit "/"
    page.should have_content("Jimmy")
  end
end
