class CreateAppSettings < ActiveRecord::Migration
  def change
    create_table :app_settings do |t|
      t.boolean :display_contest, default: true
      t.boolean :display_recommended_articles, default: true

      t.timestamps
    end
    AppSetting.create!
  end
end
