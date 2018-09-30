class AddStickyToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :sticky, :integer
  end
end
