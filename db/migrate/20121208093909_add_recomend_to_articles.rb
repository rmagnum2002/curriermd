class AddRecomendToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :recomend, :integer
  end
end
