class AddNumberAndYearToEditions < ActiveRecord::Migration[5.2]
  def change
    add_column :editions, :number, :integer
    add_column :editions, :year, :integer
  end
end
