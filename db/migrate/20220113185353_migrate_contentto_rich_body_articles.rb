class MigrateContenttoRichBodyArticles < ActiveRecord::Migration[6.0]

  #migrating the existing data from content to the richbody/
    def up
      Article.find_each do |article|
        article.update(rich_body: article.content)
    end
  end
  #migrating the data from rich_body to content, and set all existing data in rich body to nill so AR knows how to revert in case we need to use rollbacks
  def down
    Article.find_each do |article|
    article.update(content: article.rich_body)
    article.update(rich_body: nil)
    end
  end

end
