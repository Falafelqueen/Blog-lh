class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if @article.save!
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def new
    @article = Article.new
  end

  private

  def article_params
    params.require(:article).permit(:title, :content,:category)
  end
end
