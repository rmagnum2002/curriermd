class ArticlesController < InheritedResources::Base
  before_filter :load_search_bar

  def index
    if params[:search]
      @articles = @search.order('published_at desc').paginate(:page => params[:page], :per_page => 5)
    elsif params[:tag]
      @articles = Article.tagged_with(params[:tag]).order('published_at desc').paginate(:page => params[:page], :per_page => 5)
    elsif params[:author]
      @articles = Article.authored_with(params[:author]).order('published_at desc').paginate(:page => params[:page], :per_page => 5)
    elsif params[:year]
      @articles = Article.not_contest.year(params[:year]).order('published_at desc').paginate(:page => params[:page], :per_page => 5)
    elsif params[:edition]
      @articles = Article.not_contest.in_edition(params[:edition]).order('published_at desc').paginate(:page => params[:page], :per_page => 5)
    else
      @class_articles = true
      @articles = Article.not_contest.order('published_at desc').paginate(:page => params[:page], :per_page => 5)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  def show
    @article = Article.find(params[:id])
    @article.increment!(:views, 1)
    @related_articles = Article.tagged_with(@article.tag_list).limit(4)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  def edit
    redirect_to root_path, notice: "Sorry, the page you are looking for doesn't exists"
  end

  # def update
  #   @art = Article.where(sticky: true).first
  #   if @art.present?
  #     @art.sticky = 0
  #     @art.save
  #   end
  #   @article = Article.find(params[:id])

  #   respond_to do |format|
  #     if @article.update_attributes(params[:article])
  #       format.html { redirect_to admin_article_path(@article), notice: 'Article was successfully updated.' }
  #       format.json { head :ok }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @article.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def new
    redirect_to root_path, notice: "Sorry, the page you are looking for doesn't exists"
  end

  def destroy
    redirect_to root_path, notice: "Sorry, the page you are looking for doesn't exists"
  end
end
