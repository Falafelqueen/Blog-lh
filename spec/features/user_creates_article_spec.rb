require "rails_helper"

feature "User creates a new article" do
  scenario "Successfully" do
    visit login_path
    fill_in "Email", with: "example@example.com"
    fill_in "Password", with: "example"
    click_on "Log in"

    click_on "Add"
    fill_in "article[title]", with: "Example"
    fill_in "Subtitle", with: "Example"
    fill_in_trix_editor "article_rich_body_trix_input_article", "Example text"
    fill_in "Category", with: "Example"
    click_on "Post"

    expect(page).to have_css  ".trix-content", text: "Example text"
    expect(page).to have_css ".article-show h1", text: "Example"
  end
end
