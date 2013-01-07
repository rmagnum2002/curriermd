ActiveAdmin.register Author do
  index do
    selectable_column
    column "ID", sortable: :id do |author|
      author.id
    end
    column "Titre", sortable: :title do |author|
      link_to author.name, admin_author_path(author)
    end
    column "Articles par auteur", sortable: :title do |author|
      link_to Article.authored_with(author.name).count, admin_edition_path(author)
    end
    column "Cree a la date", sortable: :created_at do |author|
      l author.created_at, format: :long
    end
    default_actions
  end

  show do |ad|
    attributes_table do
      row :name
      row :created_at
      row :updated_at
    end
    panel "Articles de cet auteur" do
      table_for Article.authored_with(author.name) do
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
