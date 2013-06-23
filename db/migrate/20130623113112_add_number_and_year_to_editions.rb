class AddNumberAndYearToEditions < ActiveRecord::Migration
  def change
    add_column :editions, :number, :integer
    add_column :editions, :year, :integer
  end
end
