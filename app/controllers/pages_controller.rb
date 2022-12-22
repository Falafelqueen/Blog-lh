class PagesController < ApplicationController
  def home
    articles = Article.all.order(created_at: :desc)
    @article_newest = articles.first
    @article_second_newest = articles.second
  end
end
