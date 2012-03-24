require "spec_helper"

feature "Using jquery-tmpl-rails", js: true do
  after do
    Rails.application.config.jquery_templates.prefix = ''
  end

  scenario "Loading a page using a jQuery template" do
    visit "/"
    page.should have_content("Jimmy")
  end

  scenario "Using a template prefix", js: true do
    Rails.application.config.jquery_templates.prefix = 'templates'
    visit "/prefix"
    page.should have_content("Jimmy")
  end

  scenario "Using a regular expression as a template prefix", js: true do
    Rails.application.config.jquery_templates.prefix = %r{([^/]*/)*}
    visit "/prefix"
    page.should have_content("Jimmy")
  end
end
