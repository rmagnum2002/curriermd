module ArticlesHelper
  def sticky_article
    Article.where(sticky: true).first
  end

  def latest_articles
    Article.order('created_at desc').limit(3).offset(5)
  end

  def most_viewed_articles
    Article.order('views desc').limit(3)
  end
end
