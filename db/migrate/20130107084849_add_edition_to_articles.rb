class AddEditionToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :edition_id, :integer
  end
end
