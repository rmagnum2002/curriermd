module ApplicationHelper
  def title(page_title)
     content_for(:pagetitle) { page_title }
  end

  def lang_links
    LOCALES.keys.sort.map { |k| link_to_if(@locale != k, k, set_locale_path(:lang => k,
          :back => request.fullpath))}.join " | "
  end

  def tag_cloud(tags, classes)
    max = tags.sort_by(&:count).last
    tags.each do |tag|
      index = tag.count.to_f / max.count * (classes.size - 1)
      yield(tag, classes[index.round])
    end
  end

  def author_cloud(authors, classes)
    max = authors.sort_by(&:count).last
    authors.each do |author|
      index = author.count.to_f / max.count * (classes.size - 1)
      yield(author, classes[index.round])
    end
  end

end
