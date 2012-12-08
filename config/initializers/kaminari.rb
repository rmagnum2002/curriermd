# fix for active_admin
Kaminari.configure do |config|
  config.page_method_name = :per_page_kaminari
end