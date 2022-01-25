class PagesController < ApplicationController
  def home
    articles = Article.all.order(created_at: :desc)
    @article_newest = articles[0]
    @article_second_newest = articles[1]
  end
end
