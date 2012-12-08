class ArticlesController < InheritedResources::Base

  def index
    @class_articles = true
      @q = Article.search(params[:q])
    if params[:q]
      @articles = @q.result(:distinct => true).paginate(:page => params[:page], :per_page => 5)
    elsif params[:tag]
       @articles = Article.tagged_with(params[:tag]).order('created_at desc').paginate(:page => params[:page], :per_page => 5)
    elsif params[:author]
      @articles = Article.authored_with(params[:author]).order('created_at desc').paginate(:page => params[:page], :per_page => 5)
    else
      @articles = Article.order('created_at desc').paginate(:page => params[:page], :per_page => 5)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  def show
    @article = Article.find(params[:id])
    @article.increment!(:views, 1)
    @related_articles = Article.tagged_with(@article.tag_list).limit(3)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # def edit
  #   # redirect_to root_path, :notice => "Uknown URL"
  #   @article = Article.find(params[:id])
  # end
end
