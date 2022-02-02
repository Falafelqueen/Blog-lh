require 'rails_helper'

RSpec.feature "UserArticleActions", type: :feature do
  context "user is logged in" do
    scenario "creates article" do
      visit new_article_path

    end
  end

end
