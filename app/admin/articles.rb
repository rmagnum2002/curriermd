ActiveAdmin.register Article do
  index do
    selectable_column
    column "ID", :sortable => :id do |article|
      article.id
    end
    column "Titre", :sortable => :title do |article|
      link_to article.title, admin_article_path(article)
    end
    column "Edition" do |article|
      link_to article.edition.name, admin_edition_path(article.edition) if article.edition.present?
    end
    column "Recommande", :sortable => :recomend do |article|
      Article::RECOMENDED[article.recomend]
    end
    column "Sticky", :sortable => :sticky do |article|
      Article::STICKY[article.sticky]
    end
    column "Contest", :sortable => :is_contest do |article|
      article.is_contest
    end
    column "Cree a la date", :sortable => :created_at do |article|
      l article.created_at, :format => :long
    end
    actions
  end

  show do
    render "article"
    # active_admin_comments
  end

  form do |f|
    render "form"
  end

  controller do
    def create
      @article = Article.new(permitted_params)
      respond_to do |format|
        if @article.save
          format.html { redirect_to admin_article_path(@article), notice: 'Article was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      @article = find_resource
      @sticky = Article.where(sticky: true)

      respond_to do |format|
        if @article.update_attributes(permitted_params)
          format.html { redirect_to admin_article_path, notice: 'Article was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end

    def permitted_params
      params[:article].permit! if params[:article]
    end

    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end
end
