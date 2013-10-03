# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.courrier.md"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # add '/articles'
  add articles_path, priority: 0.10, changefreq: 'monthly'
  add a_propos_de_nous_path, priority: 0.9, changefreq: 'yearly'
  add contact_path, priority: 0.8, changefreq: 'yearly'
  add membres_path, priority: 0.7, changefreq: 'yearly'
  #
  # Add all articles:
  #
  Article.find_each do |article|
    add article_path(article), lastmod: article.updated_at, priority: 0.6, changefreq: 'monthly'
  end
end