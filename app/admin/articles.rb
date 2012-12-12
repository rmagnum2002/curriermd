ActiveAdmin.register Article do

  index do
    selectable_column
    column "ID", :sortable => :id do |article|
      article.id
    end
    column "Title", :sortable => :title do |article|
      link_to article.title, admin_article_path(article)
    end
    column "Created at", :sortable => :created_at do |article|
      l article.created_at, :format => :long
    end
    column "Recomended", :sortable => :created_at do |article|
      Article::RECOMENDED[article.recomend]
    end
    column "Sticky", :sortable => :created_at do |article|
      Article::STICKY[article.sticky]
    end
    default_actions
  end

  show do
    render "article"
    active_admin_comments
  end

  form do |f|
    render "form"
  end

  controller do
    def update
      @article = Article.find(params[:id])
      @sticky = Article.where(sticky: true)

      respond_to do |format|
        if @article.update_attributes(params[:article])
          format.html { redirect_to admin_article_path, notice: 'Article was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end
  end
end
