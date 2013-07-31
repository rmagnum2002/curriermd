class WelcomeController < ApplicationController

    def set_locale
    request_language = request.env['HTTP_ACCEPT_LANGUAGE']
    request_language = request_language.nil? ? nil : request_language[/[^,;]+/]

    if LOCALES.keys.include?(l = params[:lang]) && cookies[:lang] != l
      cookies[:lang] = {:value => l, :expires => 1.year.from_now}
    end

    if params[:back] !~ /^\//
      redirect_to root_path
    else
      redirect_to((params[:back]).gsub(/[\r\n]/, ''))
    end
  end

  def index
    @class_home = true
    @search = Article.search(params[:search])
    @last_edition_articles = Edition.last.articles.order('published_at desc').limit(3)
    # @main_articles = Article.order('published_at desc').limit(5)
    @recomends = Article.where(recomend: true).order('published_at desc').limit(6)
  end

  def about
    @class_about = true
    @search = Article.search(params[:search])
    @about = About.first
  end


  def contact
    @class_contact = true
    @search = Article.search(params[:search])
  end

  def membres
    @class_membres = true
    @search = Article.search(params[:search])
    @membre = Member.first
  end

  def all_editions
    @editions = Edition.order("year desc").order("number desc")
    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end

  def articles_by_years
    @articles = Article.order("published_at desc").uniq.pluck("EXTRACT(YEAR FROM published_at)")

    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end

  def feedback
    @feedback = Feedback.new
    if request.post?
      @feedback = Feedback.new params[:feedback]
      if @feedback.save
        UserMailer.feedback(@feedback).deliver
        redirect_to contact_path, :notice => "Feedback sent. Thank you!"
      else
        redirect_to contact_path, :notice => "Feedback not sent."
      end
    end
  end

end
