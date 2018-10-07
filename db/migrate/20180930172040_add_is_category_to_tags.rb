class AddIsCategoryToTags < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :is_category, :boolean, default: false
    Tag.where(name: %w[Media Social Moldavie Politique Education Economie]).update_all(is_category: true)
  end
end
