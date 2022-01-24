require 'rails_helper'

RSpec.describe Article, type: :model do
  before(:all) do
    @user = User.create(username:"example2", email: "example2@example.com", password: "example")
  end
  after(:all) do
    @user.delete
  end

  context "valid Article" do

    it "has a title" do
      article = Article.new( subtitle:"Example", content: "Example text", category: "example", user_id: @user.id)
      article2 = Article.new( title: "Example", subtitle:"Example", content: "Example text", category: "example", user_id: @user.id)

      expect(article).not_to be_valid
      expect(article2).to be_valid
    end
    it "has a subtitle" do
      article = Article.new( title:"Example", content: "Example text", category: "example", user_id: @user.id)

      expect(article).not_to be_valid
    end
    it "has a body of text" do
      article = Article.new( title: "example", subtitle:"Example", category: "example", user_id: @user.id)

      expect(article).not_to be_valid
    end
    it "belongs to at least one category" do
      article = Article.new( title: "Example", subtitle:"Example", content: "Example text", user_id: @user.id)

      expect(article).not_to be_valid
    end

    it "has an author" do
      article = Article.new( title: "Example", subtitle:"Example", content: "Example text", category: "example")

      expect(article).not_to be_valid
    end

    it "is valid if it has title, subtitle, content, category and author" do
      valid_article = Article.new( title: "Example", subtitle:"Example", content: "Example text", category: "example", user_id: @user.id)

      expect(valid_article).to be_valid
    end
  end
end
