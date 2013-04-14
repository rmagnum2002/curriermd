ActiveAdmin.register Edition do

  index do
    selectable_column
    column "ID", sortable: :id do |edition|
      edition.id
    end
    column "Titre", sortable: :title do |edition|
      link_to edition.name, admin_edition_path(edition)
    end
    column "articles dans edition", sortable: :title do |edition|
      link_to edition.articles.count, admin_edition_path(edition)
    end
    column "Cree a la date", sortable: :created_at do |edition|
      l edition.created_at, format: :long
    end
    default_actions
  end

  show do |ad|
    attributes_table do
      row :name
      row :created_at
    end
    panel "Articles de ce numero" do
      table_for edition.articles do
        column "Titre" do |article|
          link_to article.title, admin_article_path(article)
        end
        column "Cree a la date" do |article|
          l article.created_at, format: :long
        end
      end
    end
    active_admin_comments
  end
end
