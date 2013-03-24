task :article => :environment do
  puts 'Updating articles...'
  Article.find_each do |article|
    article.published_at = article.created_at
    article.save
  end
end
