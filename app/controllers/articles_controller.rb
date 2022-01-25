class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
    @article_resources = @article.resources
  end

  def new
    @article = Article.new
    @article.resources.build

  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save!
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
     if @article.update!(article_params)
      redirect_to @article
     else
      render :edit
     end
  end

  private

  def article_params
    params.require(:article).permit(:title, :subtitle, :rich_body ,:category, :user_id, resources_attributes:[:title, :link, :categories])
  end
end
