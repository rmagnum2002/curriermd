class AddIsContestToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :is_contest, :boolean, default: false
  end
end
