class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.text :list

      t.timestamps
    end
  end
end
