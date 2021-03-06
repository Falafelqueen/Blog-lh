require "rails_helper"

feature "User creates a new article" do

   before(:all) do
    @user = build(:user)
  end



  scenario "Successfully" do
    visit login_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
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
