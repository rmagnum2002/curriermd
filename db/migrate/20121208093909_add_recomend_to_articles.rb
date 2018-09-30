class AddRecomendToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :recomend, :integer
  end
end
