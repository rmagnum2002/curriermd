module ArticlesHelper
  def sticky_article
    Article.not_contest.where(sticky: true).first
  end

  def latest_articles
    Article.not_contest.order('published_at desc').limit(3).offset(5)
  end

  def most_viewed_articles
    Article.not_contest.order('views desc').limit(3)
  end

  def articles_by_edition
    Edition.uniq
  end

  def last_edition
    edition = Edition.order("year desc").limit(1).first
  end

  def og_image
    if @article && @article.avatar.attached?
      "http://courrier.md#{@article.avatar}"
    else
      "http://courrier.md#{asset_path 'logo.png'}"
    end
  end
end
