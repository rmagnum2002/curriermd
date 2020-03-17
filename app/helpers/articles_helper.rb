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
    @last_edition ||= Edition.order('year desc').limit(1).first
  end

  def og_image
    return "http://courrier.md#{asset_path 'logo.png'}" unless @article && @article.avatar.attached?

    Rails.application.routes.url_helpers.rails_representation_url(
      @article.avatar.variant(resize: '710x350!').processed,
      only_path: true
    )
  end

  def og_description
    if @article
      ActionView::Base.full_sanitizer.sanitize(@article.content).truncate(
        400, omission: '...'
      ).html_safe
    else
      "Courrier de Moldavie,
      Bulletin de la section moldave de
      l’Union Internationale de la Presse Francophone,
      presse Francophone en Moldavie."
    end
  end
end
