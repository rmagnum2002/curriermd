class Ckeditor::Asset < ActiveRecord::Base
  include ActiveRecord
  include Ckeditor::Orm::ActiveRecord::AssetBase
  include Ckeditor::Backend::CarrierWave

  delegate :url, :current_path, :size, :content_type, :filename, :to => :data

  validates_presence_of :data
end
