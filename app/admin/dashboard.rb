ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
  #   div :class => "blank_slate_container", :id => "dashboard_default_message" do
  #     span :class => "blank_slate" do
  #       span "Welcome to Active Admin. This is the default dashboard page."
  #       small "To add dashboard sections, checkout 'app/admin/dashboards.rb'"
  #     end
  #   end

    # Here is an example of a simple dashboard with columns and panels.

    columns do
      column do
        panel "Recent Articles" do
          ul do
            Article.order('created_at desc').limit(5).map do |article|
              li link_to(article.title, admin_article_path(article))
            end
          end
        end
      end

      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end
      end
    end
  end # content
end
