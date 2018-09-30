class AddEditionToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :edition_id, :integer
  end
end
