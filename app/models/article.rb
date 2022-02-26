class Article < ApplicationRecord
  belongs_to :user
  has_many :resources
  accepts_nested_attributes_for :resources
  has_rich_text :rich_body
  validates :title,:subtitle,:category, :rich_body, presence: true


  def self.search(search)
    # gets all articles names, breaks the titles into an array of words checks whether the search word is in the array, returns those that include that
    articles = Article.all
    matching_articles = []
    articles.each do |article|
      article_name_array = article.title.downcase.split
      if article_name_array.include?(search.downcase)
         matching_articles << article
      end
    end
    return matching_articles
  end
end
