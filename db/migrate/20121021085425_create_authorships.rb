class CreateAuthorships < ActiveRecord::Migration[5.2]
def change
    create_table :authorships do |t|
      t.belongs_to :article
      t.belongs_to :author

      t.timestamps
    end
  end
end
