class Article < ActiveRecord::Base
  attr_accessible :author_id, :category_id, :content, :preview, :title, :author_list, :tag_tokens,
                  :tag_list, :avatar, :avatar_cache, :remove_avatar, :author_ids, :author_tokens, :tag_ids,
                  :recomend, :sticky
  acts_as_taggable

  # translates :title, :content, :preview
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :authorships
  has_many :authors, through: :authorships
  has_many :taggings
  has_many :tags, through: :taggings
  attr_reader :author_tokens, :tag_tokens

  RECOMENDED = { 1 => 'Recomended', 0 => '' }
  STICKY = { 1 => 'Sticky', 0 => '' }

  # class Translation
  #   attr_accessible :locale
  # end


  # methods to display authors and links to their articles
  #
  def author_tokens=(tokens)
    self.author_ids = Author.ids_from_tokens(tokens)
  end

  def self.authored_with(name)
    Author.find_by_name!(name).articles
  end

  def author_list
    authors.map(&:name) #.join(", ")
  end

  def self.author_counts
  Author.select("authors.*, count(authorships.author_id) as count").
    joins(:authorships).group("authorships.author_id")
  end
  #
  # end methods to have displayed authors and links to their articles


  # methods to display tags and links to their articles
  #
  def tag_tokens=(tokens)
    self.tag_ids = Tag.ids_from_tokens(tokens)
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).articles
  end

  def tag_list
    tags.map(&:name) #.join(", ")
  end

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id")
  end
  #
  # end methods to have displayed authors and links to their articles

  mount_uploader :avatar, ArticleAvatarUploader
end
