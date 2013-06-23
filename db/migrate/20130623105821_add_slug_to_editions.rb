class AddSlugToEditions < ActiveRecord::Migration
  def change
    add_column :editions, :slug, :integer
  end
end
