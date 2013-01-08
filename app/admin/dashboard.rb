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
  @articles =  Article.order('created_at desc').limit(5)
  @most_viewed = Article.order('views desc').limit(5)

    columns do
      column do
        panel "Derniers articles" do
          table_for @articles do
            column "Titre" do |article|
              link_to(article.title, admin_article_path(article))
            end
            column "Auteur" do |article|
              raw article.author_list.map { |t| link_to t, admin_author_path(t) }.join(', ')
            end
            column "Cree a" do |article|
              l article.created_at
            end
          end
        end
      end
      column do
        panel "Les plus vues" do
          table_for @most_viewed do
            column "Titre" do |article|
              link_to(article.title, admin_article_path(article))
            end
            column "Clics" do |article|
              article.views
            end
            column "Auteur" do |article|
              raw article.author_list.map { |t| link_to t, admin_author_path(t) }.join(', ')
            end
            column "Cree a" do |article|
              l article.created_at
            end
          end
        end
      end
    end
  end # content
end
