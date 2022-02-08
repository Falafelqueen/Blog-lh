require 'rails_helper'

RSpec.feature "UserArticleActions", type: :feature do
  context "user is logged in" do
    before(:all) do
      @user = build(:user)
    end
    scenario "creates an article" do
      visit login_path
      fill_in "Email", with: @user.email
      fill_in "Password", with: @user.password
      click_on "Log in"

      visit articles_new_path

      fill_in "article[title]", with: "Example"
      fill_in "Subtitle", with: "Example"
      fill_in_trix_editor "article_rich_body_trix_input_article", "Example text"
      fill_in "Category", with: "Example"
      click_on "Post"

      expect(page).to have_css ".info-line-small p", text: @user.username
    end
  end

end
