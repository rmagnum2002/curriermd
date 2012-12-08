class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.text :list

      t.timestamps
    end
  end
end
