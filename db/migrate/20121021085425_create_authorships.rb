class CreateAuthorships < ActiveRecord::Migration
def change
    create_table :authorships do |t|
      t.belongs_to :article
      t.belongs_to :author

      t.timestamps
    end
    add_index :authorships, :article_id
    add_index :authorships, :author_id
  end
end
