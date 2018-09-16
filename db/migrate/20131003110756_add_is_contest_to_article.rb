class AddIsContestToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :is_contest, :boolean, default: false
  end
end
